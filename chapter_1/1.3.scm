(define (square x) (* x x))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(define (isBigger? x y)
	(if (> x y)
			x
			y))

(define (sum-of-two-bigger-squares a b c)
  (sum-of-squares (isBigger? a b) 
                  (isBigger? (isBigger? a b) c)))