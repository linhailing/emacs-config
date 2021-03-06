;;;; packages.el
;;;;
(when (>= emacs-major-version 24)
    (require 'package)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
            ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)
;; Add Packages
    (defvar henry/packages '(
    			 ;; --- Auto-completion ---
			 company
			 ;; --- Better Editor ---
			 exec-path-from-shell
			 ;; --- Themes ---
			 monokai-theme
			 ;; solarized-theme
			 ;; --- Better Editor ---
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 popwin
			 markdown-mode
			 expand-region
			 web-mode
			 iedit
			 helm-ag
			 flycheck
			 yasnippet
			 auto-yasnippet
			 evil
			 evil-leader
			 window-numbering
			 powerline
			 evil-surround
			 evil-nerd-commenter
			 which-key
			 company-anaconda
			 ) "Default packages")

(setq package-selected-packages henry/packages)

(defun henry/packages-installed-p ()
        (loop for pkg in henry/packages
        when (not (package-installed-p pkg)) do (return nil)
       finally (return t)))

(unless (henry/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg henry/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; 开启自动补全功能
(global-company-mode t)

;; 记录打开过的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; 开启括号匹配 use add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 设置theme
(load-theme 'monokai t)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;匹配()，""， ''
(require 'smartparens-config)
;; (smartparens-global-strict-mode t)
(smartparens-global-mode t)
;; 在某个文件类型中不让“'”成对出现
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; popwin setting
(require 'popwin)
(popwin-mode t)

;; hungry-delete
;;(require 'hungry-delete)
(global-hungry-delete-mode t)

;; flycheck-mode 这里只是检查js
;; (global-flycheck-mode t)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; yasnippet
;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)
(require 'yasnippet)
;;(yas-global-mode 1)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; evil
(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;; eval-laeader key
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "ps" 'helm-ag-project-root
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  "qq" 'save-buffers-kill-emacs)
;; window-numbering true
(window-numbering-mode t)

;; setting config powerline
;;(require 'powerline)
;;(powerline-default-theme)
;;(powerline-center-evil-theme)
;;(powerline-vim-theme)
;; evil-surround config
(require 'evil-surround)
(global-evil-surround-mode 1)
;; evil-normal
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;; which-key
(which-key-mode t)
(setq which-key-side-window-location 'right)

;; python confing
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code)
							   company-dabbrev)))
	  )
;; 有时候很卡的原因
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
;; 文件末尾
(provide 'init-packages)
