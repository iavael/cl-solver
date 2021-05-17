(load "analyse.lisp")
(load "calculate.lisp")
(load "synthesize.lisp")

(defun main ()
  (parentheses-off
    (calculate-expr
      (analyse-expr nil '(nil)
        '(
           (x + (x + 1)) + (2 + (x + 3)) - (x + (x - 1)) - (2 + (x - 3)) +
           (x + (1 + x)) + (2 + (3 + x)) - (x + (1 - x)) - (2 + (3 - x)) +
           ((x + 1) + x) + ((x + 3) + 2) - ((x - 1) + x) - ((x - 3) + 2) +
           ((1 + x) + x) + ((3 + x) + 2) - ((1 - x) + x) - ((3 - x) + 2)
           )
        )
      )
    )
  )
(trace calculate-expr)
(main)
