(define list1 (list '(a b c (list '(d f (list '(d f g)))) d)))

(define list2 (list '(a b c (list '(d f (list '(f g)))) d)))

(define (custom-equal? x y)
  (cond ((and (pair? x) (pair? y)) 
          (and (custom-equal? (car x) (car y))
                      (custom-equal? (cdr x) (cdr y)))) 
        (else (eq? x y))))


(custom-equal? list1 list2)