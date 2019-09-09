(define (make-rat n d) 
	(if (< n 0)
	(cons n (abs d))
	(cons (abs n) (abs d))))

(define (number x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
	(make-rat (+ (* (numer x) (denom y))
								(* (numer y) (denom x)))
							(* (denom x) (denom y))))

(define (sub-rat x y)
	(make-rat (- (* (numer x) (denom y))
								(* (numer y) (denom x)))
							(* (denom x) (denom y))))

(define (div-rat x y)
	(make-rat (* (numer x) (denom y))
							(* (denom x) (numer y))))

(define (equal-rat? x y)
	(= (* (numer x) (denom y))
			(* (numer y) (denom x))))

(define (mul-rat x y)
	(make-rat (* (numer x) (numer y))
							(* (denom x) (denom y))))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))