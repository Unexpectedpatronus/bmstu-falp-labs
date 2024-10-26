(defun fibonacci (n)
  (if (<= n 1)
      n
      (+ (fibonacci (- n 1)) (fibonacci (- n 2)))))

(defun fibonacci-tail (n &optional (a 0) (b 1))
  (if (= n 0)
      a
      (fibonacci-tail (- n 1) b (+ a b))))


(defun factorial (n)
  (if (<= n 1)
      1
      (* n
         (factorial (- n 1)))))

(defun factorial-tail (n &optional (acc 1))
  (if (<= n 1)
      acc
      (factorial-tail (- n 1) (* acc n))))
