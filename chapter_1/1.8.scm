(define (square x) (* x x))
(define (cube x) (* x x x))

(define (good-enough? quess x)
  (< (abs (- (cube quess) x)) 0.001))

(define (improve quess x)
  (/ (+ (/ x (square quess))
      (* 2 quess))
    3))

(define (cbrt-iter quess x)
  (if (good-enough? quess x)
  quess
  (cbrt-iter (improve quess x) 
              x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 64)