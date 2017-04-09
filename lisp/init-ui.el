;; 设置一些emacs框架的属性
;; 关闭导航栏
(tool-bar-mode -1)
;; 关闭右边滚动条
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode t)
;; 关闭启动画面
(setq inhibit-splash-screen t)



;; 关闭警告音
(setq ring-bell-function 'ignore)

;; 文件末尾
(provide 'init-ui)
