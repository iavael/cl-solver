(setf *addsub* '(+ -))
(setf *muldiv* '(/ *))
(setf *actions* '(^ / * - + =))
(defun elder (p q)
  (or (null q)
    (member q (member p *actions*))))
(defun analyse-expr (tree stack expr)
  (cond
    ((null expr)
      (if (car stack)
        (conv tree stack expr)
        (car tree)))
    ((atom expr) expr)
    ((atom (car expr))
      (cond
        ((not (member (car expr) *actions*))
          (analyse-expr
            (cons (car expr) tree)
            stack
            (cdr expr)))
        ((elder (car expr) (car stack))
          (analyse-expr
            tree
            (cons (car expr) stack)
            (cdr expr)))
        (t (conv tree stack expr))))
    (t (analyse-expr
         (cons
           (analyse-expr
             nil
             '(nil)
             (car expr))
           tree)
         stack
         (cdr expr)))))
(defun conv (tree stack expr)
  (analyse-expr
    (cons
      (list
        (car stack)
        (cadr tree)
        (car tree))
      (cddr tree))
    (cdr stack)
    expr))
