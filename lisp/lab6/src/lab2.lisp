(defun quad-and-or (a b c)
  (let* ((discriminant (- (* b b) (* 4 a c)))
         (sqrt-disc (sqrt (abs discriminant)))
         (denom (* 2 a)))
    (or
     (and (>= discriminant 0)
          (list (/ (+ (- b) sqrt-disc) denom)
                (/ (- (- b) sqrt-disc) denom)))
     (list (complex (/ (- b) denom) (/ sqrt-disc denom))
           (complex (/ (- b) denom) (- (/ sqrt-disc denom)))))))


(defun quad-if (a b c)
  (let* ((discriminant (- (* b b) (* 4 a c)))
         (sqrt-disc (sqrt (abs discriminant)))
         (denom (* 2 a)))
    (if (>= discriminant 0)
        (list (/ (+ (- b) sqrt-disc) denom)
              (/ (- (- b) sqrt-disc) denom))
        (list (complex (/ (- b) denom) (/ sqrt-disc denom))
              (complex (/ (- b) denom) (- (/ sqrt-disc denom)))))))


(defun quad-cond (a b c)
  (let* ((discriminant (- (* b b) (* 4 a c)))
         (sqrt-disc (sqrt (abs discriminant)))
         (denom (* 2 a)))
    (cond
     ((>= discriminant 0)
       (list (/ (+ (- b) sqrt-disc) denom)
             (/ (- (- b) sqrt-disc) denom)))
     (t
       (list (complex (/ (- b) denom) (/ sqrt-disc denom))
             (complex (/ (- b) denom) (- (/ sqrt-disc denom))))))))