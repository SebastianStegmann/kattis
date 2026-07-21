#lang racket

(define a 5)

(define (calc a)
  (displayln (* 4 (sqrt a))))

(calc a)