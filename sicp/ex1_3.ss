(define (max-of-two x y)
  (cond ((> x y) x) 
        (else y)))

(define (min-of-two x y)
  (cond ((< x y) x)
        (else y)))

(define (square-of x)
  (* x x))

(define (max-two-square-of-three x y z)
  (+ (square-of (max-of-two x y))
     (square-of (max-of-two z (min-of-two x y)))))

