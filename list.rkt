#lang kihi

require (prefix-in (racket/ racket)
         "util.rkt")

provide (list/next
         list/next-else
         list/filter)

define (list/next-else (f) (g))
  (branch (g drop) (f car under (cdr) copy) racket/empty? copy)

define (list/next f)
  (list/next-else f ())

define (list/filter pred)
  (list/next-else λ (x xs) (bind (c) (if c (cons x) ()
                                      list/filter pred xs)
                            apply pred x)
                  (nil))
