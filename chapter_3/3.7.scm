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
          ((eq? p password) (display "Неизвестная операция"))
          (else (display "Неверный пароль"))))
  dispatch)

(define acc (make-account 50 '1234))

((acc 'deposit '1234) 10)

; *****

(define (make-joint prev-acc prev-pass new-pass)

  (define is-prev-pass-valid?
    (let ((x0 ((prev-acc 'deposit prev-pass) 0))
          (x1 ((prev-acc 'deposit prev-pass) 10))
          (x2 (- ((prev-acc 'withdraw prev-pass) 5) 5)))
          (= x0 x2)))

  (define (dispatch m p)
    (if (eq? p new-pass) 
      (prev-acc m prev-pass)
    (display "Неверный пароль")))

  (if is-prev-pass-valid?
    dispatch
    (display "Пароль от исходного аккаунта неверен")))
  
  
(define paul-acc
  (make-joint acc '1234 'qwerty))

((paul-acc 'deposit 'qwerty) 300)

((acc 'withdraw '1234) 65)

((paul-acc 'deposit 'qwert) 5)