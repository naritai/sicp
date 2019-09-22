
(define (map list f)
  (if (null? list)
    nil
    (cons (f (car list)) 
          (map (cdr list) f))))

(define (square x) (* x x))

(define (square-list items)
  (map items square))

(define nums (list 1 2 3 4 5))

(square-list nums)