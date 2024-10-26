(defun discriminant (a b c)
  (- (* b b) (* 4 a c)))

(defun quadratic-solution (a b d)
  (let ((sqrt-d (sqrt (abs d)))
        (denom (* 2 a)))
    (if (>= d 0)
        ;; Если дискриминант неотрицательный, корни вещественные
        (list (/ (+ (- b) sqrt-d) denom)
              (/ (- (- b) sqrt-d) denom))
        ;; Если дискриминант отрицательный, корни комплексные
        (list (complex (/ (- b) denom) (/ sqrt-d denom))
              (complex (/ (- b) denom) (- (/ sqrt-d denom)))))))


(defun solve-quadratic-apply (a b c)
  (let ((d (discriminant a b c)))
    (apply #'quadratic-solution (list a b d))))


(defun solve-quadratic-funcall (a b c)
  (let ((d (discriminant a b c)))
    (funcall #'quadratic-solution a b d)))