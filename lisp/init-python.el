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
;; (elpy-use-ipython)

;; 添加提示框
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '((company-files flycheck-mode) company-dabbrev))))

(add-hook 'python-mode-hook
	  '(lambda ()
	     (auto-complete-mode -1)
	     ))

;; 文件末尾
(provide 'init-python)
