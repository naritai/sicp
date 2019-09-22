(define (deep-reverse items)
  (cond ((null? items) items)
        ((pair? (car items))
          (cons (deep-reverse (car items)) (deep-reverse (cdr items))))
        (else (append (deep-reverse (cdr items)) (list (car items))))))


; why append ?
; if (car items) is a primitive value and (cdr items) - another part of list
; we should make from (car items) new list and append (reverse moment) the other part (cdr items)
; which is just another call (deep-reverse (cdr items)) that move into the deep of the structure

;Why cons ?
; if (car items) is actually a pair, we should work with it like with pair
; we should change x y -> y x just like (cons x y), and in fact, we have to 
; call on each pair another (deep-reverse), because each of them can contain more that one primitive value.
