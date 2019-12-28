(define (make-account balance password)
  
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
              balance)
    "Недостаточно денег на счете"))

  (define (deposit amount)
    (set! balance (+ balance amount))
      balance)

  (define (dispatch m p)
    (cond ((and (eq? m 'withdraw) (eq? p password)) withdraw)
          ((and (eq? m 'deposit) (eq? p password)) deposit)
          ((eq? p password) (error "Неизвестная операция" m))
          (else (error "Неверный пароль"))))
  dispatch)

(define acc (make-account 50 '1234))

((acc 'withdraw '1234) 20)
((acc 'deposit '1234) 63)

((acc 'deposit2 '1234) 63)
  
  
