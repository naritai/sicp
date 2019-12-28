(define (square x) (* x x))

(define (make-monitored f)
  (let ((amount 0))
    (lambda (param)
      (cond ((eq? param 'how-many-calls?) amount)
            ((eq? param 'reset-counter)
              (set! amount 0)
              amount)
            (else (set! amount (+ amount 1))
                  (f param))))))

(define ms (make-monitored square))

(display (ms 2))

(display (ms 9))

(display (ms 'how-many-calls?))

(display (ms 'reset-counter))