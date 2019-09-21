(define list1 (list 1 2 3 4 5))

(define (reverse items)
  (define (reverse-iter items acc)
    (if (null? items)
        acc
        (reverse-iter (cdr items) (cons (car items) acc))))
  (reverse-iter items '()))

; more elegant way
; (define (reverse-list lst)
;   (if (null? lst)
;       '()
;       (append (reverse-list (cdr lst)) (list (car lst)))))

(reverse list1)