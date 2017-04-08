(fset 'yes-or-no-p 'y-or-n-p)

;;
;; 也可以把上面两句合起来
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; show-paren-mode 可以使鼠标在括号上是高亮其所匹配的另一半括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
;; 文件末尾
(provide 'init-better-default)
