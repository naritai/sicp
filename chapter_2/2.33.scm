(define x1 (list 1 2 3 4 5))
(define x2 (list 6 7 8 9 10))

(define (square x) (* x x))

(define (accumulate op initial sequence) 
    (if (null? sequence)
        initial
        (op (car sequence)
  (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) 
      (cons (p x) y))
              '()
              sequence))

(define (append seq1 seq2) 
	(accumulate cons seq2 seq1))



(define (length sequence) 
	(accumulate (lambda (x y) 
      (+ 
				(if (not (pair? x)) 
						1 
						0) 
				y)) 
			0 sequence))
