#lang racket

(define/contract (repeated-n-times nums)
  (-> (listof exact-integer?) exact-integer?)

  (let/ec return
   (for/fold ([elements (set)])
             ([num nums])

     (when (set-member? elements num)
       (return num))

     (set-add elements num))))
