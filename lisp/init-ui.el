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

;; 设置默认的语言为utf-8
(set-language-environment "UTF-8")

;; ============================================================
;; Setting English Font
;; Setting Chinese Font
;;中文与外文字体设置
;;set font family
;;(set-default-font "-outline-consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")
(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Microsoft YaHei" :size 12)))
;; 文件末尾
(provide 'init-ui)
