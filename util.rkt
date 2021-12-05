#lang kihi

require (prefix-in (racket/
                    racket))

provide (branch
         compare)

define (branch t e c)
  (if c t e)

define (compare l e g a b)
  (if < a b l (if > a b g e))
