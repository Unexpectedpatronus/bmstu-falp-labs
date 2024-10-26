(defun cons-list ()
  (cons 1
        (cons 2
              (cons (cons 3
                          (cons
                            (cons (cons (cons 4 nil) nil) nil)
                            (cons 5 nil)))
                    (cons 6
                          (cons (cons 7
                                      (cons (cons 8
                                                  (cons 9 nil))
                                            nil))
                                (cons 0 nil)))))))

(defun list-method ()
  (list 1 2
        (list 3
              (list (list (list 4)))
              5)
        6
        (list 7 (list 8 9))
        0))

(defun quote-method ()
  '(1 2 (3 (((4))) 5) 6 (7 (8 9)) 0))
