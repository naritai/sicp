(define (width-interval interval)
	(/ (- (upper-bound interval) 
				(lower-bound interval))
		 2.0))

(define inter1 (make-interval 4 8))
(define inter2 (make-interval 5 14))
(define inter3 (add-interval inter1 inter2))
(define inter4 (sub-interval inter2 inter1))
(define inter5 (mul-interval inter1 inter2))
(define inter6 (div-interval inter2 inter1))

(display (width-interval inter1)) ; 2
(display (width-interval inter2)) ; 4.5
(display (width-interval inter3)) ; 6.5
(display (width-interval inter4)) ; 2.5

;****************************************
(display (width-interval inter5)) ; 46
(display (width-interval inter6)) ; 1.4375




