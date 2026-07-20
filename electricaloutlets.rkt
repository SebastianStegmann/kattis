#lang racket

(define N (read))

(define (sum-input total-count)
  (for/sum ([i (in-range total-count)])
    (read)))


(for ([i N])
  (define K (read))
  (if (= K 0)
      (displayln 1)
      (displayln (- (sum-input K) (- K 1)))
      ))