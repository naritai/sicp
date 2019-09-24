(define x (list 1
      (list 2 (list 3 4) 5)
      (list 6 7)))

(define (square x) (* x x))

(define (square-tree items)
  (cond ((null? items) items) 
        ((not (pair? items)) (square items))
        (else (cons (square-tree (car items))
                    (square-tree (cdr items))))))

(square-tree x)


; recursive with map
(define (square-tree items)
  (map (lambda (sub-tree) 
               (if (pair? sub-tree)
               (square-tree sub-tree)
               (square sub-tree)))
               items))