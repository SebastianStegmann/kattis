#lang racket

(define X (read))
(define Y (read))
(define N (read))

(define (fizzbuzz X Y N hlp)
  (cond ((> hlp N) (void))
    ( (and (= 0 (modulo hlp X)) (= 0 (modulo hlp Y))) (display "FizzBuzz\n") (fizzbuzz X Y N (+ hlp 1)))
        ((= 0 (modulo hlp Y)) (display "Buzz\n") (fizzbuzz X Y N (+ hlp 1)))
        ((= 0 (modulo hlp X)) (display "Fizz\n") (fizzbuzz X Y N (+ hlp 1)))
        (else (printf "~a\n" hlp ) (fizzbuzz X Y N (+ hlp 1)))))
        
(fizzbuzz X Y N 1)