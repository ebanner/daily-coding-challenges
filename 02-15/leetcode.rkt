#lang racket

;; #lang errortrace racket
;; (require errortrace)
;; (error-print-context-length 10000)

(require racket/format)
(require racket/string)

(define (get-vector string)
  (for/vector ([c string])
    (- (char->integer c)
       (char->integer #\0))))

(define (pad b n)
  (~a b #:min-width n #:align 'right #:pad-string "0"))

(define/contract (add-binary a b)
  (-> string? string? string?)

  (define-values (aa bb)
    (if (< (string-length a) (string-length b))
        (values b a)
        (values a b)))

  (define N (string-length aa))

  (define-values (A B)
    (values (get-vector aa) (get-vector (pad bb N))))

  (define result
    (let/ec return
      (let loop ([carry 0]
                 [i (sub1 N)]
                 [acc '()])
        (when (< i 0)
          (return
           (if (= carry 1)
               (cons carry acc)
               acc)))

        (define-values (new-carry digit)
          (quotient/remainder (+ (vector-ref A i) (vector-ref B i) carry)
                              2))

        (loop new-carry
              (sub1 i)
              (cons digit acc)))))

  (string-join (map number->string result) ""))
