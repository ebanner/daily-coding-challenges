#lang racket


(define/contract (has-alternating-bits n)
  (-> exact-integer? boolean?)

  (define (zero n)
    (cond [(= n 0) #t]
          [(= (remainder n 2) 0) #f]
          [else (one (arithmetic-shift n -1))]))

  (define (one n)
    (cond [(= n 0) #t]
          [(= (remainder n 2) 1) #f]
          [else (zero (arithmetic-shift n -1))]))

  (if (= (remainder n 2) 0)
      (one n)
      (zero n)))
