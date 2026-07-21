#lang racket

(define a (read))
(define b (read))

(define (takkar a b)
  (cond
    [(> a b) (displayln "MAGA!")]
    [(> b a) (displayln "FAKE NEWS!")]
    [else (displayln "WORLD WAR 3!")]))

(takkar a b)
