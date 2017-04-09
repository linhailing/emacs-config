;; org-mode
;; org edit
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 文件末尾
(provide 'init-org)
