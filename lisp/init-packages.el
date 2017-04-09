;;;; packages.el
;;;;
(when (>= emacs-major-version 24)
    (require 'package)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
            ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)
;; Add Packages
(defvar henry/packages '(
			 ;; --- Auto-completion ---
			 company
			 ;; --- Better Editor ---
			 exec-path-from-shell
			 ;; --- Themes ---
			 monokai-theme
			 ;; solarized-theme
			 ;; --- Better Editor ---
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 popwin
			 markdown-mode
			 expand-region
			 ) "Default packages")

(setq package-selected-packages henry/packages)

(defun henry/packages-installed-p ()
    (loop for pkg in henry/packages
        when (not (package-installed-p pkg)) do (return nil)
       finally (return t)))

(unless (henry/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg henry/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; 开启自动补全功能
(global-company-mode t)

;; 记录打开过的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; 开启括号匹配 use add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 设置theme
(load-theme 'monokai t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;匹配()，""， ''
(require 'smartparens-config)
(smartparens-global-strict-mode t)
;; 在某个文件类型中不让“'”成对出现
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; popwin setting
(require 'popwin)
(popwin-mode t)

;; hungry-delete
;;(require 'hungry-delete)
(global-hungry-delete-mode t)


;; 文件末尾
(provide 'init-packages)
