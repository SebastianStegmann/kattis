#lang racket

(define discard (read))
(define input (read))
(define inputlist (string->list (symbol->string input)))



(define (scanner lst seen-l? seen-v? prev)
  (cond
    [(and (or seen-l? seen-v?) (empty? lst)) 1]
    [(empty? lst) 2]
  
    [(and prev (char=? prev #\l) (char=? (car lst) #\v)) 0]
      
    [(char=? (car lst) #\v)
     (scanner (cdr lst) seen-l? #t (car lst))]

    [(char=? (car lst) #\l)
     (scanner (cdr lst) #t seen-v? (car lst))]
    [else (scanner (cdr lst) seen-l? seen-v? (car lst))]))

(displayln (scanner inputlist #f #f #f))

