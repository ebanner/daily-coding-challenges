#lang racket

(require data/gvector)

(define (get-run-lengths s)
  (define N (string-length s))

  (define (one run i run-lengths)
    (let/ec return
      (when (= i N)
        (when (> run 0)
          (gvector-add! run-lengths run))
        (return run-lengths))

      (if (char=? (string-ref s i) #\1)
          (one (add1 run) (add1 i) run-lengths)
          (begin
            (gvector-add! run-lengths run)
            (zero 0 i run-lengths)))))

  (define (zero run i run-lengths)
    (let/ec return
      (when (= i N)
        (when (> run 0)
          (gvector-add! run-lengths run))
        (return run-lengths))

      (if (char=? (string-ref s i) #\0)
          (zero (add1 run) (add1 i) run-lengths)
          (begin
            (gvector-add! run-lengths run)
            (one 0 i run-lengths)))))

  (define run-lengths
    (if (char=? (string-ref s 0) #\0)
        (zero 0 0 (make-gvector))
        (one 0 0 (make-gvector))))

  (gvector->list run-lengths))

(define/contract (count-binary-substrings s)
  (-> string? exact-integer?)

  (define run-lengths (get-run-lengths s))

  (for/fold ([num-binary-substrings 0])
            ([r1 run-lengths]
             [r2 (rest run-lengths)])
    (+ (min r1 r2) num-binary-substrings)))
