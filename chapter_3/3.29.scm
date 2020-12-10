(define (or-gate a1 a2 output)
  (let* ([i1 (make-wire)]
         [i2 (make-wire)]
         [r (make-wire)])

    (inverter a1 i1)
    (inverter a2 i2)
    (and-gate i1 i2 r)
    (inverter r output))
  `ok)


; delay time = and-gate-delay + (invert-delay * 2)