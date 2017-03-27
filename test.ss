(define (sum-of num-list)
  (if (null? num-list) 0
      (+ (car num-list)
         (sum-of (cdr num-list)))))

(define (fib n)
  (if (zero? n) 0
      (if (= n 1) 1
          (+ (fib (- n 1))
             (fib (- n 2))))))

(define (fib2 n)
  (if (or (= n 0)
          (= n 1)) n
      (+ (fib (- n 1))
         (fib (- n 2)))))

; (if (zero? 0) 4
    ; (+ "hello" 4.5 '(8 2)))
(define (flatten sequence)
  (cond (((null? sequence) '())
         ((list? (car sequence))
            (append (flatten (car sequence))
                    (flatten (cdr sequence))))
         (#t (cons (car sequence)
                     (flatten (cdr sequence)))))))

; (define (sorted? num-list)
  ; (or (< (length num-list) 2)
      ; (and (<= (car num-list)
               ; (cadr num-list))
           ; (sorted? (cdr num-list)))))

(define (sorted? seq comp)
  (or (< (length seq) 2)
      (and (comp (car seq)
                 (cadr seq))
           (sorted? (cdr seq) comp))))

(define (my-uary-map fn seq)
  (if (null? seq) '()
      (cons (fn (car seq))
            (my-uary-map fn (cdr seq)))))

; 1.1.7
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)

  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                  x)))

;(define (good-enough?2 guess x)

;

(define (translate points delta)
  (map (lambda (x)
         (+ x delta))
       points))
(define (translate2 points delta)
  (define (shift-by x)
    (+ x delta))
  (map shift-by points))

; (define (sum x y)
  ; (+ x y))
; (define sum
  ; (lambda (x y) (+ x y)))

(define (ps set)
  (if (null? set) '(())
    (append (ps (cdr set))
            (map (lambda (subset)
                   (cons (car set) subset))
                 (ps (cdr set))))))
(define (ps set)
  (if (null? set) '(())
    (let ((ps-rest (ps (cdr set))))
      (append ps-rest
              (map (lambda (subset)
                     (cons (car set) subset))
                   ps-rest)))))
(define (permute items)
  (if (null? items) '(())
    (apply append
           (map (lambda (elem)
                  (map (lambda (permutation)
                         (cons elem permutation))
                       (permute (remove items elem))))
                items))))
; '(1 2 3)
; (cons 1 (cons 2 (cons 3 '())))
