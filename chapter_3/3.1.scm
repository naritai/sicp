(define (make-accumulator sum)
  (let ((answer sum))
    (lambda (amount) 
      (set! answer (+ answer amount))
                answer)))

(define A (make-accumulator 15))

(A 5)
