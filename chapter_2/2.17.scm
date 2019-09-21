(define list1 (list 1 2 3))

(define (last-pair lst)
  (let ((tail (cdr lst)))
    (if (null? tail)
    lst
    (last-pair tail))))

(last-pair list1)