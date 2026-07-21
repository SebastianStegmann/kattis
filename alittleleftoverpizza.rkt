#lang racket

(define n (read))

(define smax 6)
(define mmax 8)
(define lmax 12)

(define (leftover s m l n)
  (define size (read))
  (define slices (read))
  (cond [(equal? size 'S)  ((which n) (+ s slices) m l (- n 1))]
        [(equal? size 'M)  ((which n) s (+ m slices) l (- n 1))]
        [(equal? size 'L)  ((which n) s m (+ l slices) (- n 1))]))

(define (which n)
  (if (= n 1)
      calcall
      leftover))

(define (calcall s m l _)
  (+ (calc s smax) (calc m mmax) (calc l lmax)))

(define (calc amount mxm)
  (cond
    [(= amount 0) 0]
    ;; if below max for box
    [(> mxm amount) 1]
     ;; if more than exact fit
    [(> (remainder amount mxm) 0) (+ (quotient amount mxm) 1)]
    ;; if perfect fit
    [(= (remainder amount mxm) 0) (/ amount mxm)]
    ))

(leftover 0 0 0 n)