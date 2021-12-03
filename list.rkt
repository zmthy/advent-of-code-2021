#lang kihi

require (prefix-in (racket/ racket)
         "util.rkt")

provide (list/next)

define (list/next (f))
  (branch (drop) (f car under (cdr) copy) racket/empty? copy)
