;; custom config
;; 这是emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "==")
 '(git-gutter:update-interval 2)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style 'relative)
 '(package-selected-packages
   (quote
    (helm-gtags company exec-path-from-shell hungry-delete swiper counsel smartparens js2-mode popwin markdown-mode expand-region web-mode iedit helm-ag flycheck yasnippet auto-yasnippet evil evil-leader window-numbering powerline evil-surround evil-nerd-commenter which-key company-anaconda emmet-mode php-mode ac-php auto-complete ac-etags git-gutter-fringe git-gutter monokai-theme)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 60))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(iedit-occurrence ((t (:inherit region))))
 '(js2-external-variable ((t (:foreground "gray")))))


;; 文件末尾
(provide 'custom)
