(defun parentheses-off (x)
  (if
    (atom x)
    x
    (append
      (parentheses-off-op (first x) (second x))
      (list (first x))
      (parentheses-off-op (first x) (third x)))))
(defun parentheses-off-op (op expr &aux (x (parentheses-off expr)))
  (if
    (or
      (atom x)
      (elder op (second x)))
    (list x)
    x))
