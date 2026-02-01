#lang racket

(define ≤ <=)

(define (get-smallest-number nums)
  (apply min nums))

(define (get-second-smallest-number nums)
  (define-values (_ second-smallest-number)
    (for/fold ([a +inf.0] [b +inf.0])
              ([c nums])
      (cond
        [(≤ b c) (values a b)]
        [(and (≤ a c) (≤ c b)) (values a c)]
        [(≤ c a) (values c a)])))

  second-smallest-number)

(define/contract (minimum-cost nums)
  (-> (listof exact-integer?) exact-integer?)

  (define smallest-number (get-smallest-number (rest nums)))
  (define second-smallest-number (get-second-smallest-number (rest nums)))

  (define minimum-cost (+ (first nums) smallest-number second-smallest-number))

  (inexact->exact minimum-cost))
