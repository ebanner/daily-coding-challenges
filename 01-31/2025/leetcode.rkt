#lang racket

(define ≤ <=)

(define (get-smallest-numbers nums)
  (for/fold ([a +inf.0] [b +inf.0])
            ([c nums])
    (cond
      [(≤ b c) (values a b)]
      [(and (≤ a c) (≤ c b)) (values a c)]
      [(≤ c a) (values c a)])))

(define/contract (minimum-cost nums)
  (-> (listof exact-integer?) exact-integer?)

  (define-values (smallest-number second-smallest-number)
    (get-smallest-numbers (rest nums)))

  (define-values (cost-1 cost-2 cost-3)
    (values (first nums)
            smallest-number
            second-smallest-number))

  (define minimum-cost-sum (+ cost-1 cost-2 cost-3))

  (inexact->exact minimum-cost-sum))
