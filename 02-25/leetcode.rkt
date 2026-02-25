#lang racket

(define (>> n) (arithmetic-shift n -1))
(define (% n) (remainder n 2))

(define (in-pairs xs)
  (make-do-sequence
   (λ ()
     (define (pos->vals s)
       (define t (car s))
       (cond
         [(and (pair? t) (pair? (cdr t)) (null? (cddr t)))
          (values (car t) (cadr t))]
         [else
          (error 'in-pairs "expected 2-element list, got ~v" t)]))
     (values pos->vals cdr xs pair? #f #f))))

(define (list2<? a b)
  (define a0 (first a)) (define b0 (first b))
  (cond [(< a0 b0) #t]
        [(> a0 b0) #f]
        [else (< (second a) (second b))]))

(define (get-ones num)
  (let loop ([num-ones 0]
             [num num])
    (if (zero? num)
        num-ones
        (loop (+ (% num) num-ones)
              (>> num)))))

(define/contract (sort-by-bits arr)
  (-> (listof exact-integer?) (listof exact-integer?))

  (define pairs
   (sort (for/list ([num arr])
           (list (get-ones num) num))
         list2<?))

  (for/list ([(_ num) (in-pairs pairs)])
    num))
