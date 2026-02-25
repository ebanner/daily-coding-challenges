#lang racket

(define (satisfies? n num)
  (= (bitwise-ior n (add1 n))
     num))

(define (get-ans num)
  (or
   (for/first ([n (in-range num)]
               #:when (satisfies? n num))
     n)
   -1))

(define/contract (min-bitwise-array nums)
  (-> (listof exact-integer?) (listof exact-integer?))

  (for/list ([num nums])
    (get-ans num)))
