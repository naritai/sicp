(define tree1 (list 1 2 (list 6 7 8 9 10) 3 4 5 (list 1 2 3 5 7)))

(define (accumulate op initial sequence) 
    (if (null? sequence)
        initial
        (op (car sequence)
  (accumulate op initial (cdr sequence)))))



