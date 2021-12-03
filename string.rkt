#lang kihi

require (prefix-in (racket/ racket)
         "list.rkt"
         "util.rkt")

provide (string/split)

define (string/split at)
  (list/next (under (with-arity (racket/string-join) 2 swap at))
             with-arity (racket/string-split) 2 swap at)
