#lang racket

(define (>> n) (arithmetic-shift n -1))
(define (% n k) (remainder n k))

(define (get-gap n)
  (let loop ([n (>> n)]
             [gap 1])
    (cond [(= n 0) (values 0 0)]
          [(= (% n 2) 1) (values gap n)]
          [else (loop (>> n) (add1 gap))])))

(define/contract (binary-gap n)
  (-> exact-integer? exact-integer?)

  (define shifted-n
    (let loop ([n n])
      (if (= (% n 2) 1)
          n
          (loop (>> n)))))

  (let/ec return
    (let loop ([max-gap 0]
               [n shifted-n])

      (when (zero? n)
        (return max-gap))

      (define-values (gap new-n) (get-gap n))

      (loop (max gap max-gap) new-n))))
