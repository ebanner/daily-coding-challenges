#lang racket

(define ≤ <=)

(define/contract (is-trionic nums)
  (-> (listof exact-integer?) boolean?)

  (define vector-nums (list->vector nums))
  (define n (vector-length vector-nums))

  (let/ec return

    (define i
      (let loop ([i 0])
        (cond
          [(= i (sub1 n)) (return #f)]
          [(>= (vector-ref vector-nums i) (vector-ref vector-nums (add1 i))) i]
          [else (loop (add1 i))])))

    (when (= i 0)
      (return #f))

    (define j
      (let loop ([j i])
        (cond
          [(= j (sub1 n)) (return #f)]
          [(<= (vector-ref vector-nums j) (vector-ref vector-nums (add1 j))) j]
          [else (loop (add1 j))])))

    (when (= j i)
      (return #f))

    (define k
      (let loop ([k j])
        (if (and
             (< k (sub1 n))
             (< (vector-ref vector-nums k) (vector-ref vector-nums (add1 k))))
            (loop (add1 k))
            k)))

    (when (= j k)
      (return #f))

    (= k (sub1 n))))
