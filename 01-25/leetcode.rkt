#lang racket

(require racket/list)

(define/contract (minimum-difference nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)

  (define n (length nums))
  (define sorted-nums (sort nums <))

  (define min-difference
    (for/fold ([min-difference +inf.0])
              ([i (in-range 0 (add1 (- n k)))])

      (define window (take (drop sorted-nums i) k))
      (define difference (- (last window) (first window)))

      (min difference min-difference)))

  (inexact->exact min-difference))
