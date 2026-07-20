#lang racket

(define X (read))
(define N (read))
(define P (for/list ([i N])
            (read)))

(+ X (apply  + (map (lambda (x) (- X x)) P)))