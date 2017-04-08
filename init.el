;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comment.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
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



;;(add-to-list 'load-path "~/.emacs.d/lisp/")
;; 下面的是自己配置的参数
;; 关闭导航栏
(tool-bar-mode -1)
;; 关闭右边滚动条
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode t)
;; 关闭启动画面
(setq inhibit-splash-screen t)

;; 开启自动补全功能
(global-company-mode t)

;; 修改鼠标的样式
(setq-default cursor-type 'bar)

;; 关闭备份文件
(setq make-backup-files nil)
;; disable auto-save-list
(setq auto-save-default nil)

;; org edit
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 记录打开过的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


;; 开启选择删除一段或是一个词
(delete-selection-mode t)

;; 开启括号匹配 use add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 开启鼠标在哪一行
(global-hl-line-mode t)

;; 设置theme
(load-theme 'monokai t)

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;匹配()，""， ''
(require 'smartparens-config)
(smartparens-global-strict-mode t)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 定义查看某个函数在哪儿
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 当外部修改是自动加载文件
(global-auto-revert-mode t)

;; popwin setting
(require 'popwin)
(popwin-mode t)

;; abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("ll" "henry")
					    ("ms" "macrosoft")
					    ))


;; 定义一个lisp测试函数
(defun open-my-init()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gray")))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
