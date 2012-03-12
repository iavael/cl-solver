(load "/home/noname/.workspace/SquareEq/analyse.lisp")
(load "/home/noname/.workspace/SquareEq/calculate.lisp")
(load "/home/noname/.workspace/SquareEq/synthesyse.lisp")

(defun main ()
  (parentheses-off
    (calculate-expr
      (analyse-expr nil '(nil)
        '(
;;          (2 * x + 5 - 4 * x) ^ 2 - (3 + 6 - 2 + 19) ^ 3 = ( 4 * x + 1 ) * x + x ^ (5 - 2 ^ 2)
           (x + (x + 1)) + (2 + (x + 3)) - (x + (x - 1)) - (2 + (x - 3)) +
           (x + (1 + x)) + (2 + (3 + x)) - (x + (1 - x)) - (2 + (3 - x)) +
           ((x + 1) + x) + ((x + 3) + 2) - ((x - 1) + x) - ((x - 3) + 2) +
           ((1 + x) + x) + ((3 + x) + 2) - ((1 - x) + x) - ((3 - x) + 2)
;           (x * (x * 4)) * (2 * (x * 3)) / (x * (x / 4)) / (2 * (x / 3)) *
;           (x * (4 * x)) * (2 * (3 * x)) / (x * (4 / x)) / (2 * (3 / x)) *
;           ((x * 4) * x) * ((x * 3) * 2) / ((x / 4) * x) / ((x / 3) * 2) *
;           ((4 * x) * x) * ((3 * x) * 2) / ((4 / x) * x) / ((3 / x) * 2)
           )
        )
      )
    )
  )
(trace calculate-expr)
(main)
