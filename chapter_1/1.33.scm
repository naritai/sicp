(define (square x) (* x x))

(define (divides? a b) 
  (= (modulo b a) 0))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor) 
  (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) 
  (find-divisor n 2))

(define (prime? n)
 (if (= n (smallest-divisor n))))


(define (filtered-accumulate filter combiner null-value term a next b)
	(if (and (> a b) (filter a))
	null-value
	(combiner (term a)
						(accumulate combiner 
												null-value 
												term 
												(next a) 
												next 
												b))))

(define (sum-of-simple-squares x y)
	(filtered-accumulate prime? + 0 identity x inc y))

(sum-of-simple-squares 1 10)