#lang racket

(require racket/list)


(define (non-decreasing? nums)
  (cond [(empty? nums) #t]
        [(= (length nums) 1) #t]
        [(not (<= (first nums) (second nums))) #f]
        [else (non-decreasing? (rest nums))]))


(define (get-min-sum-idx nums)
  (define-values (min-idx _)
    (for/fold ([min-idx 0] [min-sum (add1 +inf.0)])
              ([i (in-naturals)]
               [a nums] [b (rest nums)])
      (let ([sum (+ a b)])
        (if (< sum min-sum)
            (values i sum)
            (values min-idx min-sum)))))
  min-idx)


(define (get-replaced nums max-idx)
  (let loop ([i 0] [nums nums])
    (cond [(empty? nums) '()]
          [(= i max-idx)
           (let ([sum (+ (first nums) (second nums))])
             (cons sum (loop (+ i 2) (rest (rest nums)))))]
          [else (cons (first nums) (loop (add1 i) (rest nums)))])))


(define (transform nums)
  (define min-idx (get-min-sum-idx nums))
  (define replaced (get-replaced nums min-idx))
  replaced)


(define/contract (minimum-pair-removal nums)
  (-> (listof exact-integer?) exact-integer?)
  (let loop ([nums nums] [num-iters 0])
    (if (non-decreasing? nums)
        num-iters
        (let ([transformed (transform nums)])
          (loop transformed (add1 num-iters))))))
