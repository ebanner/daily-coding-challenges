#lang racket

; Definition for a binary tree node.
#|

; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node
(val left right) #:mutable #:transparent)

; constructor
(define (make-tree-node [val 0])
(tree-node val #f #f))

|#

(define (<< n) (arithmetic-shift n 1))

(define (is-leaf? node)
  (and (equal? (tree-node-left node) #f) (equal? (tree-node-right node) #f)))

(define/contract (sum-root-to-leaf root)
  (-> (or/c tree-node? #f) exact-integer?)

  (define SUM 0)

  (define (search node num)
    (let/ec return
      (when (equal? node #f)
        (return))

      (when (is-leaf? node)
        (set! SUM (+ (bitwise-ior (<< num) (tree-node-val node))
                     SUM))
        (return))

      (define new-num (bitwise-ior (<< num) (tree-node-val node)))

      (search (tree-node-left node) new-num)
      (search (tree-node-right node) new-num)))

  (search root 0)

  SUM)

;;; main

;; (let ([tree (make-tree-node 1)])
;;   (sum-root-to-leaf tree))

;; (let ([tree (tree-node 1
;;                        (make-tree-node 0)
;;                        (make-tree-node 1))])

;;   (sum-root-to-leaf tree))

;; (let ([tree (tree-node 1
;;                        (tree-node 0
;;                                   (make-tree-node 0)
;;                                   (make-tree-node 1))
;;                        (tree-node 1
;;                                   (make-tree-node 0)
;;                                   (make-tree-node 1)))])
;;   (sum-root-to-leaf tree))


;; (let ([tree (make-tree-node 0)])
;;   (sum-root-to-leaf tree))

;; (let ([tree (tree-node 1
;;                        (make-tree-node 1)
;;                        #f)])
;;   (sum-root-to-leaf tree))
