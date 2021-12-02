#lang kihi

require (racket/stream
         "util.rkt")

provide (stream/empty
         stream/cons
         stream/fold
         stream/next
         stream/split
         stream/take
         stream/drop
         rename-out ([stream-empty? stream/empty?]
                     [stream-map stream/map]
                     [stream-first stream/first]
                     [stream-rest stream/rest]))

define (stream/empty)
  (racket (stream))

define (stream/cons head (rest))
  (racket (stream-cons #:eager (kihi head) (kihi rest)))

define (stream/next (f))
  (branch (drop) (f stream-first under (stream-rest) copy)
          stream-empty? copy)

define (stream/fold f)
  (stream/next (stream/fold f under f swap))

define (stream/split at stream)
  (if or zero? at (stream-empty? stream)
      (nil)
      (stream/next (cons under (stream/split - at 1)))
      stream)

define (stream/take)
  (drop swap stream/split)

define (stream/drop)
  (drop stream/split)
