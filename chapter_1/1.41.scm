(define (double f )
	(lambda (x) (f (f x))))

(define double-square 
	(double (lambda (y) (* y y))))

(double-square 2)