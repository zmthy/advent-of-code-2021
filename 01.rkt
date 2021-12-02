#lang kihi

require ("stream.rkt"
         "util.rkt")

provide (count-increased
         count-increased-window)

define (count-increased)
  (stream/next
   flip
   (drop stream/fold (under (branch (+ 1) () >) copy))
   swap 0)

define (window size step stream)
  (bind (next)
        (if < length next size
            (stream/empty)
            (stream/cons next (window size step stream/drop step stream)))
        stream/take size stream)

define (count-increased-window)
  (count-increased stream/map (list/fold (+) swap 0) window 3 1)
