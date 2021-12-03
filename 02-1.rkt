#lang kihi

require ("io.rkt"
         "02.rkt")

with-input-from-file "02.txt"
  (* track-position read-lines)
