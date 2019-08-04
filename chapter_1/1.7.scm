(define (square x) (* x x))

(define (improve quess x)
  (average quess (/ x quess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-quess)
  (< (abs (- guess new-quess)) 0.001))

(define (sqrt-iter guess new-quess x)
  (if (good-enough? guess new-quess)
  new-quess
  (sqrt-iter new-quess (improve new-quess x)
              x)))

(define (sqrt x)
  (sqrt-iter 0 1.0 x))

(sqrt 9999999)