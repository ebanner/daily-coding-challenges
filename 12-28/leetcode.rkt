#lang racket

(define (get-negatives row)
  (for/sum ([element row]
            #:when (negative? element))
    1))

(define/contract (count-negatives grid)
  (-> (listof (listof exact-integer?)) exact-integer?)

  (for/fold ([num-negatives 0])
            ([row grid])

    (define row-negatives (get-negatives row))

    (+ row-negatives num-negatives)))
