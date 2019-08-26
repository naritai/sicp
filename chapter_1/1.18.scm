(define (remainder b n)
  (cond ((or (> (- b n) n) (= (- b n) n))
           (remainder (- b n) n))
        ((= (- b n) 0) 0)
        (else (abs (- b n)))
  ))

(define (even? n)
    (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (multiply x y)
  (mult-iter x y 0))

(define (mult-iter x y a)
  (cond ((= y 0) a)
        ((even? y)
          (mult-iter (double x) (halve y) a))
        (else (mult-iter x (- y 1) (+ a x)))))

(multiply 9 9)