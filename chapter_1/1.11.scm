; recursive
(define (f n) 
  (if (< n 3)
  n
  (+ 
    (f (- n 1))
    (f (- n 2))
    (f (- n 3)))))

; (f 3) / 3
; (f 4) / 6
; (f 5) / 11
; (f 6) / 20
; (f 7) / 37
; (f 8) / 68
; (f 9) / 125
; (f 10) / 230

; iterative
(define (fi n)
  (ff-iter 0 1 2 n))

(define (ff-iter a b c count) 
  (if (= count 0)
  a
  (ff-iter b c (+ a b c) (- count 1))))