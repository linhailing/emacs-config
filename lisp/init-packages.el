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
        ;; add theme
        monokai-theme
        moe-theme
        ;; 这个插件是删除多余的空格
        hungry-delete
        ;; 增强了搜索和文件查找功能的插件(swiper, )
        swiper
        counsel
        exec-path-from-shell
        ;; 补全(), , "",''....
        smartparens
        ;; markdown mode
        markdown-mode
	popwin
	js2-mode
	nodejs-repl
	web-mode
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

(global-company-mode t)
(setq-default delete-selection-mode t)
(require 'hungry-delete)
(global-hungry-delete-mode t)
;; swiper && Counsel config setting
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; setting config by smartparens((),"",''{}...)
(require 'smartparens-config)
(smartparens-global-strict-mode t)
;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 执行js scrapt
(require 'nodejs-repl)


;; popwin 插件可以自动将光标移动到，新创建的窗口中。使用下面的代码将其启用
(require 'popwin)
(popwin-mode 1)



;; 文件末尾
(provide 'init-packages)
