#lang racket

(define m (read))
(define f (read))
(define d (read))

(if (< m f)
    (if (< m d)
        (displayln "Monnei")
        (displayln "Dolladollabilljoll"))
    (if (< f d)
        (displayln "Fjee")
        (displayln "Dolladollabilljoll")))