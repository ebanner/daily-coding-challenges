#lang errortrace racket

(require errortrace)

(error-print-context-length 10000)


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


(define (get-height node)
  (let/ec return
    (when (equal? node #f) (return 0))

    (define-values (left-height right-height)
      (values (get-height (tree-node-left node))
              (get-height (tree-node-right node))))

    (define height (add1 (max left-height right-height)))

    height))


(define/contract (is-balanced root)
  (-> (or/c tree-node? #f) boolean?)

  (let/ec return

    (when (equal? root #f) (return #t))

    (define-values (left right)
      (values (tree-node-left root) (tree-node-right root)))

    (when (> (abs (- (get-height left) (get-height right)))
             1)
      (return #f))

    (and (is-balanced left) (is-balanced right))))


;;


(let ([tree (tree-node 3
                       (make-tree-node 9)
                       (tree-node 20
                                  (make-tree-node 20)
                                  (make-tree-node 7)))])
  (is-balanced tree))

(let ([tree (make-tree-node 3)])
  (is-balanced tree))

(let ([tree #f])
  (is-balanced tree))

(let ([tree (tree-node 1 #f #f)])
  (get-height tree))

(let ([unbalanced-tree (tree-node 1
                                  (tree-node 2
                                             (tree-node 3
                                                        (tree-node 4 #f #f)
                                                        (tree-node 4 #f #f))
                                             (tree-node 3 #f #f))
                                  (tree-node 2 #f #f))])
  (is-balanced unbalanced-tree))

(is-balanced (tree-node 1
                        #f
                        (tree-node 2 #f #f)))
