#lang kihi

require ("list.rkt"
         "stream.rkt"
         "util.rkt"
         "io.rkt" racket/stream)

provide (gamma-and-epsilon
         life-support-ratings)

define (bits->list)
  (list/map (string->number with-arity (string) 1) string->list)

define (bit-list->number)
  (under (drop)
   list/fold (under (* 2) + * under (copy-over))
   reverse
   under (0 1))

define (invert-bits)
  (list/map (branch (1) (0) zero?))

define (pointwise+)
  (list/next (list/next-else (cons under (pointwise+) + under (swap)) (cons) swap-over))

struct (zeroes)
struct (same)
struct (ones)

define (most-common-bits)
  (under (drop)
   list/map (compare (zeroes) (same) (ones) under (copy))
   under (/ swap 2)
   list/fold (under (+ 1) pointwise+)
   under (nil 0))

define (common->bit-prefer-1)
  (branch (0) (1) zeroes?)

define (uncommon->bit-prefer-0)
  (branch (1) (0) zeroes?)

define (gamma-and-epsilon)
  (under (bit-list->number invert-bits)
   bit-list->number
   copy list/map (common->bit-prefer-1) most-common-bits
   stream->list stream/map (bits->list))

define (rating common->bit)
  (branch (first under (drop drop))
          (rating common->bit under (+ 1 drop))
   = 1 length copy
   list/filter (= under (copy) list-ref under (copy-under swap))
   under (list-ref under (copy)
          list/map common->bit most-common-bits) copy)

define (oxygen-generator-rating)
  (bit-list->number
   rating (common->bit-prefer-1)
   under (0))

define (co2-scrubber-rating)
  (bit-list->number
   rating (uncommon->bit-prefer-0)
   under (0))

define (life-support-ratings)
  (oxygen-generator-rating
   under (co2-scrubber-rating)
   copy
   list/map (bits->list) stream->list)
