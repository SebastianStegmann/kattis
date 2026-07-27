#lang racket

(define n (string->number (read-line)))
(define names (string-split (read-line)))

(define target (modulo 12 n))

(displayln (list-ref names target))