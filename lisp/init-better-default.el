;; 这里设置一些emacs自带的没有开启的功能
(fset 'yes-or-no-p 'y-or-n-p)

;; 修改鼠标的样式
(setq-default cursor-type 'bar)

;; 关闭备份文件
(setq make-backup-files nil)
;; disable auto-save-list
(setq auto-save-default nil)

;; 开启选择删除一段或是一个词
(delete-selection-mode t)

;; 开启鼠标在哪一行
(global-hl-line-mode t)

;; 当外部修改是自动加载文件
(global-auto-revert-mode t)

;; abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("ll" "henry")
					    ("ms" "macrosoft")
					    ))
;; 代码的缩进功能
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer. "
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;; 代码的缩进功能设置key
(global-set-key (kbd "C-M-f") 'indent-region-or-buffer)


(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))


;; 文件末尾
(provide 'init-better-default)
