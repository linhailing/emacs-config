;; 设置python

;; python confing 1
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
;; 							   company-dabbrev))))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code company-jedi)
;; 							   company-dabbrev))))


;; (add-hook 'python-mode-hook 'helm-gtags-mode)

;; elpy python 2
(elpy-enable)
(setq elpy-rpc-backend "jedi")
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ipython . t)
;;    ;; other languages..
;;    ))

;; Python customizations
;; (defun my-python-fill-string (&optional justify)
;;   (let ((old-fill-column fill-column))
;;     (setq fill-column 72)
;;     (python-fill-string justify)
;;     (setq fill-column old-fill-column)
;;   ))

(add-hook 'python-mode-hook
          (lambda () (interactive)
            (setq python-fill-docstring-style 'pep-257-nn)
            (set-fill-column 85)
            ;; (setq python-fill-string-function my-python-fill-string)
            ))

;; 文件末尾
(provide 'init-python)
