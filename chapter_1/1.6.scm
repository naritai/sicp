(define (new-if predicate then-clause else-clause) 
	(cond (predicate then-clause)
        (else else-clause)))

(define (square x) (* x x))

(define (sqrt-iter guess x) 
	(new-if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
	x)))

(define (improve quess x)
  (average quess (/ x quess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)                 


; infiite loop
; Bwcause formal parameters in line (new-if predicate then-clause else-clause)
; will be evaluated from the very beginning of the procedure invocing
; and "else-clause" will call sqrt-iter again and so on...
