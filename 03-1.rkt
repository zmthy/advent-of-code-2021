#lang kihi

require ("io.rkt"
         "03.rkt")

with-input-from-file "03.txt"
  (* gamma-and-epsilon read-lines)
