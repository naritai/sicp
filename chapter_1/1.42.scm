(define (compose f g)
	(lambda (y) (f (g y))))

(define (square x) (* x x))

(define (inc x) (+ 1 x))

((compose square inc) 6)
