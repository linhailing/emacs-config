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
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   ;; other languages..
   ))

;; 文件末尾
(provide 'init-python)
