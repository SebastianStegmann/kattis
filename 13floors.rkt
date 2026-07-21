#lang racket

(define x(read))

(define (floors x)
  (if (>= x 13)
      (displayln (+ x 1))
      (displayln x)))

(floors x)