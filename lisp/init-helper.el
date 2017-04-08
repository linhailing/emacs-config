;; config setting by hungry-delete


;; 不保存临时文件
(setq make-backup-files nil)
(setq auto-save-default nil)

(delete-selection-mode 1)

(global-hl-line-mode t)

;; 添加文件打开时自动打开那个major mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       '(("\\.phtml\\'" . web-mode))
       '(("\\.tpl\\.php\\'" . web-mode))
       '(("\\.[agj]sp\\'" . web-mode))
       '(("\\.as[cp]x\\'" . web-mode))
       '(("\\.erb\\'" . web-mode))
       '(("\\.mustache\\'" . web-mode))
       '(("\\.djhtml\\'" . web-mode))
       '(("\\.html?\\'" . web-mode))

       auto-mode-alist))


;; 文件末尾
(provide 'init-helper)
