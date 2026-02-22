#lang racket

(require racket/list)

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

(define (get-pairs arr)
  (for/list ([a arr] [b (rest arr)])
    (list a b)))

(define (get-differences pairs)
  (for/list ([(a b) (in-pairs pairs)])
    (- b a)))

(define/contract (minimum-abs-difference arr)
  (-> (listof exact-integer?) (listof (listof exact-integer?)))

  (define sorted-arr (sort arr <))
  (define pairs (get-pairs sorted-arr))
  (define differences (get-differences pairs))
  (define min-difference (apply min differences))

  (define min-pairs
    (for/list ([(difference pair) (in-pairs (map list differences pairs))]
               #:when (= difference min-difference))
      pair))

  min-pairs)
