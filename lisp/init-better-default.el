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
;; 大多数编辑器都是使用tab键来缩进代码的，如下设置
;; 因为 Emacs 的每个 major mode 所使用的缩进配置都不一样，有时候我们只想像其他编辑器一样使用 TAB 来缩进，Shift+TAB 向后缩进。
;; my fix for tab indent
(defun henry/indent-region(numSpaces)
  (progn
    ;; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))
    ;; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )
    (save-excursion                          ;; restore the position afterwards
      (goto-char regionStart)                ;; go to the start of region
      (setq start (line-beginning-position)) ;; save the start of the line
      (goto-char regionEnd)                  ;; go to the end of region
      (setq end (line-end-position))         ;; save the end of the line
      (indent-rigidly start end numSpaces) ;; indent between start and end
      (setq deactivate-mark nil)           ;; restore the selected region
      )
    )
  )


(defun henry/tab-region (N)
  (interactive "p")
  (if (use-region-p)
      (henry/indent-region 4)               ;; region was selected, call indent-region
    (insert "    ")                   ;; else insert four spaces as expected
    ))

(defun henry/untab-region (N)
  (interactive "p")
  (henry/indent-region -4))

(defun henry/hack-tab-key ()
  (interactive)
  (local-set-key (kbd "<tab>") 'henry/tab-region)
  (local-set-key (kbd "<S-tab>") 'henry/untab-region)
  )

;; emment-mode 使用的快捷键是C-j来补全的，现在修改为Tab键
(evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
(evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
(evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
(evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
(evil-define-key 'hybrid emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)


(add-hook 'prog-mode-hook 'henry/hack-tab-key)



;; 代码提示hippie-expand
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
(global-set-key (kbd "M-/") 'hippie-expand)

;; 使用C-x d 可以cmd创建文件和复制，copy文件等
;; 怎么使用 dired
;; 1. copy, delete and rename file
;; Copy/Delete/Rname files and folders
;; +: to create directory
;; C-x C-f: to create file
;; g: to refersh dired buffer
;; C: copy file
;; d: delete file
;; D: delete after confirm
;; R: rename files
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 启用 dired-x 可以让每一次进入 Dired 模式时，使用新的快捷键 C-x C-j
;; 就可以进 入当前文件夹的所在的路径。
(require 'dired-x)

(setq dired-dwin-target 1)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 当鼠标在括号内中让外面的括号高亮
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))

;; 增强occur的搜索功能，当鼠标在一个单词上时，他会自动抓取这个单词使用 M-s o 来搜索
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 使用M-s i 这个快捷键来查找某个文件中的函数模块
(global-set-key (kbd "M-s i") 'counsel-imenu)
;; 增强js2中方法
(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))


;; 文件末尾
(provide 'init-better-default)
