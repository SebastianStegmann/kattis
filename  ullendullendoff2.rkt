#lang racket

(define n (read))

(define posfromback (- n (modulo 12 n)))

;; (displayln posfromback)

(define printfirst (- n posfromback))

;; (displayln printfirst)

(define leftover (- n 1 printfirst))

;; (displayln leftover)

(define nonrelative (read))

(for ([i printfirst])
  (displayln (read)))

(displayln nonrelative)

(for ([i leftover])
  (displayln (read)))
