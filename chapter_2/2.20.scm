(define (same-parity . z)
  (define (sp-iter first acc incomings)
    (cond ((null? incomings) acc)
          ((= (modulo first 2) (modulo (car incomings) 2))
              (sp-iter first (cons (car incomings) acc) (cdr incomings)))
          (else (sp-iter first acc (cdr incomings)))))
  (sp-iter (car z) '() z))


(same-parity 1 2 3 4 5 6 7 8 9)