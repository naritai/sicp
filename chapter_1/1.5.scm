(define (p) (p))

(define (test x y)
  (if (= x 0)
0 y))

(test 0 (p))

; applicative-order evaluation -> cause an infinite loop, 
; because it needs to evaluate all operands (x and y) before apply operator (procedure test) to operands

; normal-order evaluation -> resolve to 0, because delay resolving operands and understand,  
; that because x === 0, we can omit resolving the value of y and just return 0