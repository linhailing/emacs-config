;; 设置web-mode major-mode下的tab长度为：2
(defun web-mode-base-settings ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-comment-style 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-part-face t)
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-heredoc-fontification t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
)
(add-hook 'web-mode-hook  'web-mode-base-settings)

;; 设置css,js的index长度为2(2个空格)
(defun set-css-index-size()
  "Hooks for css mode and js2-mode"
  (setq css-indent-offset 2))
(add-hook 'css-mode-hook 'set-css-index-size)
;; js
(defun set-js-index-size()
  "Hooks for css mode and js2-mode"
  (setq js-indent-level 2))
(add-hook 'js2-mode-hook 'set-js-index-size)

;; 文件末尾
(provide 'init-func)
