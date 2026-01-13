#lang racket


(define (get-distance x y x2 y2)

  (let loop ([min-distance 0] [x1 x] [y1 y])

    (cond

      [(and (= x1 x2) (= y1 y2))
       min-distance]

      [(and (≠ x1 x2) (≠ y1 y2))
       (loop
        (add1 min-distance)
        (+ x1 (if (> x2 x1) 1 -1))
        (+ y1 (if (> y2 y1) 1 -1)))]

      [(≠ x1 x2)
       (loop
        (add1 min-distance)
        (+ x1 (if (> x2 x1) 1 -1))
        y1)]

      [(≠ y1 y2)
       (loop
        (add1 min-distance)
        x1
        (+ y1 (if (> y2 y1) 1 -1)))])))


(define/contract (min-time-to-visit-all-points points)
  (-> (listof (listof exact-integer?)) exact-integer?)

    (for/fold ([min-distance 0])

              ([p1 (in-list points)]
               [p2 (in-list (rest points))])

      (let ([distance (apply get-distance (append p1 p2))])
            (+ min-distance distance))))
