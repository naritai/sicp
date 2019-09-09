(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

; unnecessary doubling code 
(define (car z)
  (define (car-iter acc num rest)
    (if (> rest 0)
    (- acc 1)
    (car-iter (+ 1 acc) (/ num 2) (modulo num 2))))
  (car-iter 0 z 0))

(define (cdr z)
  (define (car-iter acc num rest)
    (if (> rest 0)
    (- acc 1)
    (car-iter (+ 1 acc) (/ num 3) (modulo num 3))))
  (car-iter 0 z 0))

(car (cons 5 9))