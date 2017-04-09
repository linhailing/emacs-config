;; 这里设置一些我们自己常用的快捷键，一般自己设置的都是以C-c 开始的

;; 记录打开过的文件
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; swiper and counsel 这两个插件增强了搜索，打开文件，查找函数等功能
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


;; 定义查看某个函数在哪儿
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
;; M-s o(occur),  M-s i(counsel-items), C-;(iedit-mode)
(global-set-key (kbd "C-;") 'iedit-mode)

;; 当补全菜单显示出来以后可以使用C-n C-p来选择
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; use helm-age search
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 文件末尾
(provide 'init-keybindings)
