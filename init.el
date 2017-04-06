;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comment.
(package-initialize)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
