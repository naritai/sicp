(define (remainder b n)
  (cond ((or (> (- b n) n) (= (- b n) n))
           (remainder (- b n) n))
        ((= (- b n) 0) 0)
        (else (abs (- b n)))
  ))

(define (square x) (* x x))

(define (even? n)
    (= (remainder n 2) 0))

; recursive 
(define (fast-expt b n) 
  (cond ((= n 0) 1)
  ((even? n) (square (fast-expt b (/ n 2)))) 
  (else (* b (fast-expt b (- n 1))))))


; iterative
(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n)
          (expt-iter (square b) (/ n 2) a))
        (else (expt-iter b (- n 1) (* a b)))))
