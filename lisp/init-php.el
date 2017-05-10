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

;; 文件末尾
(provide 'init-php)
