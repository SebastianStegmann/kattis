#lang racket

#|
(define (fun lst ones zeros swaps)
  (begin (display ones) (display zeros) (display swaps))
  (newline)
  (cond
    [(and (empty? lst) (= ones 0) (> zeros 0)) 0]
    [(and (empty? lst) (> ones 0) (> zeros 0)) (+ swaps (* ones zeros))]
    [(empty? lst) swaps]
    [(and (= (car lst) 1) (= zeros 0))   (fun (cdr lst) (+ 1 ones) zeros swaps)]
    [(and (= (car lst) 1) (> zeros 0))   (fun (cdr lst) (+ 1 ones) 0 (+ swaps (* ones zeros)))]
    [(and (= (car lst) 0) (> ones 0))   (fun (cdr lst) ones (+ 1 zeros) swaps)]
    [(and (= (car lst) 0) (= ones 0))   (fun (cdr lst) ones zeros swaps)]
    ))

(displayln (fun '(1 0 1 1 0) 0 0 0))



(define (nfun lst ones swap)

  (cond
    ;; when list is finished check if it ends with
    [(empty? lst) swap]
    [(equal? (car lst) 0) (nfun (cdr lst) ones (+ ones swap))]
    [(equal? (car lst) 1) (nfun (cdr lst) (add1 ones) swap)]))

(displayln (nfun '(1 0 1 1 0) 0 0))
|#
(define mod 1000000007)

(define (xseq lst ones posways swap)
  (cond
    [(empty? lst) swap]
    [(equal? (car lst) #\0)
     (xseq (cdr lst)
           ones posways
           (modulo (+ swap ones) mod))]
    [(equal? (car lst) #\1)
     (xseq (cdr lst)
           (modulo (+ ones posways) mod)
           posways
           swap)]
    [(equal? (car lst) #\?)
     (xseq (cdr lst)
           (modulo (+ posways (* ones 2)) mod)
           (modulo (* posways 2) mod)
           (modulo (+ ones (* swap 2)) mod))]))

(displayln (xseq (string->list (read-line)) 0 1 0))


