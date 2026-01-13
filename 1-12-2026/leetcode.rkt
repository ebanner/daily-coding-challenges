#lang racket

(define (get-distance x y x2 y2)
  (let loop ([min-distance 0] [x1 x] [y1 y])
    ;; (printf "min=~a x1=~a y1=~a\n" min-distance x1 y1)

    (cond [(and (= x1 x2) (= y1 y2))
           min-distance]

          [(and (not (= x1 x2)) (not (= y1 y2)))
           (loop
            (add1 min-distance)
            (+ x1 (if (> (- x2 x1) 0) 1 -1))
            (+ y1 (if (> (- y2 y1) 0) 1 -1)))]

          [(not (= x1 x2))
           (loop
            (add1 min-distance)
            (+ x1 (if (> (- x2 x1) 0) 1 -1))
            y1)]

          [(not (= y1 y2))
           (loop
            (add1 min-distance)
            x1
            (+ y1 (if (> (- y2 y1) 0) 1 -1)))])))

(define/contract (min-time-to-visit-all-points points)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (let ()
    (define min-distance 0)

    (for ([p1 (in-list points)]
          [p2 (in-list (rest points))])
      (set! min-distance (+ (apply get-distance (append p1 p2)) min-distance)))

    min-distance))

(min-time-to-visit-all-points '((1 1) (3 4) (-1 0)))
