#lang racket

(require racket/format)

(define (get-times)
  (for*/list ([hour (in-range 12)]
              [minute (in-range 60)])
    (list hour minute)))

(define (get-ones hour minute)
  (define hour-ones
    (let loop ([n hour] [num-ones 0])
      (if (= n 0)
          num-ones
          (loop (arithmetic-shift n -1)
                (+ num-ones (remainder n 2))))))

  (define minute-ones
    (let loop ([n minute] [num-ones 0])
      (if (= n 0)
          num-ones
          (loop (arithmetic-shift n -1)
                (+ num-ones (remainder n 2))))))

  (+ hour-ones minute-ones))

(define (format-time hour minute)
  (format "~a:~a"
          hour
          (~r minute #:min-width 2 #:pad-string "0")))

(define/contract (read-binary-watch turnedOn)
  (-> exact-integer? (listof string?))

  (define times (get-times))

  (define matching-times
    (for/list ([time times]
               #:when (= (apply get-ones time) turnedOn))
      time))

  (for/list ([matching-time matching-times])
    (apply format-time matching-time)))
