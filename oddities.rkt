#lang racket

(define N (read))
(define X (for/list ([i N])
            (read)))

(define (isEven x)
  (if (= 0 (modulo x 2))
         (printf "~a is even\n" x)
         (printf "~a is odd\n" x)))

(for-each isEven X)