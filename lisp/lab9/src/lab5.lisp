(defun cross-product (vec1 vec2)
  (let* ((indices '((1 2) (2 0) (0 1)))
         (components (mapcar (lambda (idx)
                               (- (* (nth (first idx) vec1) (nth (second idx) vec2))
                                  (* (nth (second idx) vec1) (nth (first idx) vec2))))
                         indices)))
    components))


(defun cartesian-product (list1 list2)
  (reduce #'append
      (mapcar (lambda (x)
                (mapcar (lambda (y) (list x y)) list2))
          list1)))


(defun base-n-to-decimal (digits base)
  (reduce (lambda (acc digit) (+ (* acc base) digit)) digits))
