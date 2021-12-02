#lang kihi

require (prefix-in (racket/
                    racket))

provide (< >
         branch)

define (<)
  (with-arity (racket/<) 2)

define (>)
  (with-arity (racket/>) 2)

define (branch t e c)
  (if c t e)
