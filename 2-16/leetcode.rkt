#lang racket

(define/contract (reverse-bits n)
  (-> exact-integer? exact-integer?)

  (define-values (_ reversed-n)
    (for/fold ([n n]
               [reversed-n 0])
              ([_ (in-range 32)])

      (values (arithmetic-shift n -1)
              (bitwise-ior (remainder n 2)
                           (arithmetic-shift reversed-n 1)))))

  reversed-n)
