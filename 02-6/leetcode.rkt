#lang racket

(define/contract (construct-transformed-array nums)
  (-> (listof exact-integer?) (listof exact-integer?))

  (define nums-vector (list->vector nums))
  (define n (vector-length nums-vector))

  (define (get-left i num)
    (if (= num 0)
        (vector-ref nums-vector i)
        (let ([new-i (modulo (sub1 i) n)])
          (get-left new-i (sub1 num)))))

  (define (get-right i num)
    (if (= num 0)
        (vector-ref nums-vector i)
        (let ([new-i (modulo (add1 i) n)])
          (get-right new-i (sub1 num)))))

  (define transformed-array
    (for/list ([i (in-naturals)] [num nums])
      (cond
        [(= num 0) num]
        [(< num 0) (get-left i (abs num))]
        [(> num 0) (get-right i num)])
      ))

  transformed-array)
