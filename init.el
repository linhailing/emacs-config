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
        ;; add theme
        monokai-theme
        ;; 这个插件是删除多余的空格
        hungry-delete
        ;; 增强了搜索和文件查找功能的插件(swiper, )
        swiper
        counsel
        exec-path-from-shell
        ;; 补全(), , "",''....
        smartparens
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

;; 关闭工具栏
(tool-bar-mode -1)
;;关闭文件滑动控件
(scroll-bar-mode -1)
;;显示行号
(global-linum-mode 1)
;; 更改光标的样式
(setq-default cursor-type 'bar)
;;关闭启动帮助动画
(setq inhibit-splash-screen 1)
;; 更改显示字体大小 16pt
(set-face-attribute 'default nil :height 120)
;; 开启全局 company补全
(global-company-mode 1)

;; 显示当前的行
(global-hl-line-mode t)

(require 'recentf)
(recentf-mode 1)

(require 'org)
(setq org-src-fontify-natively t)

(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 静止备份文件
(setq make-backup-files nil)

;; 开启选择一个单词删除
(delete-selection-mode t)

;; 启动时全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 给emacs-lisp文件类型添加一个括号的自动提示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 设置函数 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file绑定到<f2>键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; plugin setting
(require 'monokai-theme)
(load-theme 'monokai 1)
;; config setting by hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;; swiper && Counsel config setting
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; setting config by smartparens((),"",''{}...)
(require 'smartparens-config)
(smartparens-global-strict-mode t)

;; gh-md



;; plugin setting



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))
