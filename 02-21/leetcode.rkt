#lang racket

(define (get-num-ones num)
  (let loop ([num num]
             [num-ones 0])
    (if (zero? num)
        num-ones
        (loop (arithmetic-shift num -1)
              (+ (remainder num 2) num-ones)))))

(define PRIMES '(2 3 5 7 11 13 17 19 23 29 31))

(define (is-prime num)
  (if (member num PRIMES)
      #t
      #f))

(define (has-prime-digits? num)
  (define num-ones (get-num-ones num))

  (is-prime num-ones))

(define/contract (count-prime-set-bits left right)
  (-> exact-integer? exact-integer? exact-integer?)

  (for/fold ([num-prime 0])
            ([num (in-range left (add1 right))])
    (if (has-prime-digits? num)
        (add1 num-prime)
        num-prime)))
