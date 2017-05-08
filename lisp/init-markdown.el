
;; markdown  config
;; (use-package markdown-mode
;;   :ensure t
;;   :commands (markdown-mode gfm-mode)
;;   :mode (("README\\.md\\'" . gfm-mode)
;;          ("\\.md\\'" . markdown-mode)
;;          ("\\.markdown\\'" . markdown-mode))
;;   :init (setq markdown-command "multimarkdown"))

;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . org-mode))

;; (autoload 'gfm-mode "markdown-mode"
;;    "Major mode for editing GitHub Flavored Markdown files" t)
;; (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; ;; markdown config
;; (add-hook 'markdown-mode-hook 'orgtbl-mode)
;; ;; markdown config
;; (global-set-key (kbd "M-h") 'markdown-export-and-preview)

;; (setq auto-mode-alist
;;       (cons '("\\.\\(md\\|markdown\\)\\'" . markdown-mode) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("\\.\\(md\\|markdown\\)\\'" . org-mode) auto-mode-alist))

;; (add-hook 'org-mode-hook 'markdown-mode)

;; (defun markdown-imenu-index ()
;;   (let* ((patterns '((nil "^#\\([# ]*[^#\n\r]+\\)" 1))))
;;     (save-excursion
;;       (imenu--generic-function patterns))))

;; (defun markdown-mode-hook-setup ()
;;   (setq imenu-create-index-function 'markdown-imenu-index))
;; (add-hook 'markdown-mode-hook 'markdown-mode-hook-setup)



;; 文件末尾
(provide 'init-markdown)
