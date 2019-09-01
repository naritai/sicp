(define (product term a next b)
	(define (iter a result)
		(if (> a b)
		result
		(iter (next a) (* (term a) result))))
	(iter a 1))

(define (identity x) x)

(define (inc y) (+ y 1))

(define (factorial n)
	(product identity 1 inc n))

(factorial 5)