#lang racket

(define N (read))

(if (= (modulo N 2) 0)
    (displayln "second")
    (displayln "first"))