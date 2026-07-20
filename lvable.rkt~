#lang racket

(define discard (read))
(define input (read))
(define inputlist (string->list (symbol->string input)))

(define (has-lv lst)
  (cond
    [(empty? lst)
     (has-v-not-first inputlist)]

    [(and (char=? (car lst) #\l)
          (not (empty? (cdr lst)))
          (char=? (car (cdr lst)) #\v))
     (display "0")]
    [else (has-lv (cdr lst))]
    ))


(define (has-v-not-first lst)
  (cond
    [(or (empty? lst)
         (empty? (cdr lst)))
     (has-l-not-last inputlist)]
     
    [(char=? (car (cdr lst)) #\v)
     (displayln "1")]
    [else (has-v-not-first (cdr lst))]))

(define (has-l-not-last lst)
  (cond
    [(empty? lst)
     (displayln "2")]
    [(and (char=? (car lst) #\l)
          (not (empty? (cdr lst))))
     (displayln "1")]
    [else (has-l-not-last (cdr lst))]))



(has-lv inputlist)