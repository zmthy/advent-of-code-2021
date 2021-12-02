#lang kihi

require ("io.rkt"
         "01.rkt")

with-input-from-file "01.txt"
  (count-increased-window read-numbers)
