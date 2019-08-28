(define (square x) (* x x))

(define (divides? a b) 
  (= (modulo b a) 0))

(define (next x)
  (if (= x 2)
  3
  (+ x 2)))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n)
  ((divides? test-divisor n) test-divisor) 
  (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n) 
  (find-divisor n 2))

(define (display-num x)
  (newline)
  (display x))

(define (prime? n)
 (if (= n (smallest-divisor n))
 (display-num n)))

(define (search-for-primes start end)
  (prime? start)
  (cond ((= start end) (prime? end))
        (else (search-for-primes (+ start 1) end))))

(search-for-primes 10000 10100)