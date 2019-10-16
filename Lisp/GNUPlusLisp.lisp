;(setq (list(nums -2 4 -3 5 -3 1 -2 3)))
;(defvar *nums* list(

(defun recursiveSum(num)
    (if (null num) 
        0
        (+ (first num) (recursiveSum (rest num)))))

(write (recursiveSum '(-2 4 -3 5 -3 1 -2 3)))
