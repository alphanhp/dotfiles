;;----------------------------------globalsetting------------------------------;;

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;自动折行
(setq-default auto-fill-function 'do-auto-fill)
 ; 自动补全括号
(electric-pair-mode t)
;; 光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode)
; 在 Mode line 上显示列号
(column-number-mode t)
;;，让 Emacs 及时刷新 Buffer
(global-auto-revert-mode t)
;; 更符合我们习惯
(delete-selection-mode t)
; 关闭启动 Emacs 时的欢迎界面
(setq inhibit-startup-screen t)
; 关闭文件自动备份
(setq make-backup-files t)
; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)
 ; 在 Window 显示行号
(global-display-line-numbers-mode 1)
;;大纲模式
(outline-minor-mode nil)
;关闭菜单栏
(menu-bar-mode -1)
; 关闭 Tool bar
(tool-bar-mode -1)
;; 图形界面时关闭滚动条
(when (display-graphic-p) (toggle-scroll-bar -1))
; 可选: 打开 Buffer 历史记录保存
(savehist-mode 1)
; 可选: 显示相对行号
(setq display-line-numbers-type 'relative)
; 可选: 设定启动图形界面时的初始Frame 宽度(字符数)
(add-to-list 'default-frame-alist '(width . 150))
; 可选: 设定启动图形界面时的初始 Frame 高度(字符数)
(add-to-list 'default-frame-alist '(height . 50))
;; 希腊文命令美化成字符
;(global-prettify-symbols-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;全局快捷键

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
 ; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")
 ; HIDE
 (define-key cm-map "q" 'outline-hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'outline-hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'outline-hide-other)        ; Hide other branches
 (define-key cm-map "c" 'outline-hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'outline-hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'outline-hide-subtree)      ; Hide everything in this entry and sub-entries
 ; SHOW
 (define-key cm-map "a" 'outline-show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'outline-show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'outline-show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'outline-show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'outline-show-subtree)      ; Show (expand) everything in this heading & below
 ; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)
; 为选中的代码加注释/去注释
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region)

; 自定义两个函数
; Faster move cursor
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))
;; 绑定到快捷键
(global-set-key (kbd "M-n") 'next-ten-lines)            ; 光标向下移动 10 行
(global-set-key (kbd "M-p") 'previous-ten-lines)        ; 光标向上移动 10 行




(provide 'init_global)
