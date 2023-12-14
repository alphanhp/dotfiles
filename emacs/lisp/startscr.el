;;;;;;;;;;;;;;;;;
;;dashboard
;;;;;;;;;;;;;;;;;

;;欢迎界面
;;列出最近打开的项目、文件
;;或标记过的书签、org-mode 日程、自定义控件
;;按下 p 或 r 快速跳转到相应小结
;;与projectile插件配合使用


(use-package dashboard
 :ensure t
  :config
 (setq dashboard-banner-logo-title "Fight along with Emacs!") ;; 个性
 ;; 签名，随读者喜好设置
 
  
 (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉
  ;; 这一行，等安装了 projectile后再使用
  
  
  

 (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
 (setq dashboard-items '((recents  . 30)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 5)
			  )) ;; 显示多少个最近项目
 (dashboard-setup-startup-hook))

(provide 'startscr)
