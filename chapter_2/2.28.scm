(define x (list (list 1 2) (list 3 4))) 
; ((1 2) (3 4))

(define (fringe items)
  (cond ((null? items) items)
        ((pair? (car items))
          (append  (fringe (car items)) (fringe (cdr items))))
        (else (cons (car items) (fringe (cdr items))))))


(fringe x)
; (1 2 3 4)

; just a simple from zero to hero tasks questions help to solve the task