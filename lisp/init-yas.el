;; yasnippet
;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)
(require 'yasnippet)
;;(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;重新设置snippets的路径
(setq yas/root-directory "~/.emacs.d/snippets") 
(yas/load-directory yas/root-directory)


;; 文件末尾
(provide 'init-yas)
