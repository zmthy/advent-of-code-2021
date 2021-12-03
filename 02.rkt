#lang kihi

require ("stream.rkt"
         "string.rkt"
         racket/stream)

provide (track-position
         track-position-with-aim)

define (track-position)
  (stream/fold (match
                   (["forward" +]
                    ["up" under right flip (-)]
                    ["down" under right (+)])
                 under (string->number) string/split " ")
   under (0 0))

define (track-position-with-aim)
  (drop swap
   stream/fold (match
                   (["forward" under (under (+ *) copy swap) + copy-under]
                    ["up" under right flip (-)]
                    ["down" under right (+)])
                 under (string->number) string/split " ")
   under (0 0 0))
