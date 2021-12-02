#lang kihi

require ("stream.rkt"
         "util.rkt")

provide (read-lines
         read-numbers)

define (read-lines)
  (bind (line)
    (if eof-object? line
        (stream/empty)
        (stream/cons line (read-lines)))
    read-line)

define (read-numbers)
  (stream/map (string->number)
              read-lines)
