(define (square x) (* x x))

(define (compose f g)
	(lambda (y) (f (g y))))

(define (repeated f n)
		(if (= 1 n)
		f
		(compose f (repeated f (- n 1)))))

((repeated square 2) 5)