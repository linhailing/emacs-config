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
(set-face-attribute 'default nil :height 140)

;; (load-theme 'monokai 1)
(require 'moe-theme)
(load-theme 'moe-dark t)
;;or
;;(load-theme 'moe-light t)

;; 关闭警告音
(setq ring-bell-function 'ignore)

;; 文件末尾
(provide 'init-ui)
