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
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))


;; 文件末尾
(provide 'init-better-default)
