#lang racket

(define (hipphipp n)
  (if (= n 1)
      (displayln "Hipp hipp hurra!")
      ( begin (displayln "Hipp hipp hurra!")
              (hipphipp (- n 1)))))

(hipphipp 20)