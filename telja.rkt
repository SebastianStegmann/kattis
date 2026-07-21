#lang racket

(define n (read))

(define (telja n i)
  (if (= n 1)
      (displayln i)
      (begin (displayln i) (telja (- n 1) (+ i 1)))))

(telja n 1)