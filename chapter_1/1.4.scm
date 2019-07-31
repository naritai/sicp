(define (a-plus-abs-b a b) 
	((if (> b 0) + -) a b))

; (if (> b 0) + -) resolved to + or - 
; then is resolved the expression (resolved operator a b)