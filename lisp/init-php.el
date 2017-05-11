(add-to-list 'load-path "~/.emacs.d/code/php-mode")
;; php-mode config

(require 'php-mode)
;; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

(eval-after-load 'php-mode
  '(require 'php-ext))

;; ;; Insert current class/namespace
(with-eval-after-load 'php-mode
  (require 'php-current)
  (define-key php-mode-map (kbd "C-c C--") 'php-current-class)
  (define-key php-mode-map (kbd "C-c C-=") 'php-current-namespace))

;; flymake-php.el
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)


;;; Enable helm-gtags-mode
(add-hook 'php-mode-hook 'helm-gtags-mode)

;; php 语法检查
(add-hook 'php-mode-hook 'flycheck-mode)

(add-hook 'php-mode-hook
            '(lambda ()
               ;;(auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
	       (require 'company-php)
	       (auto-complete-mode -1)
	       (company-mode t)
	       ;;(add-to-list 'company-backends 'company-ac-php-backend )
               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back) ;go back
               ))

;; php设置空格长度函数
(defun my-php-mode-hook()
  "My PHP mode configureation"
  (setq indent-tabs-mode 4
	tab-width 4
	c-basic-offset 4))
(add-hook 'php-mode-hook 'my-php-mode-hook)

;; 设置提示框
(add-hook 'php-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-files company-ac-php-backend company-keywords company-dabbrev company-gtags))))

;; 文件末尾
(provide 'init-php)
