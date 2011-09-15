(add-to-list 'load-path "~/.emacs.d")
(global-font-lock-mode 1)
(show-paren-mode 1)

;;my key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M- " 'complete-symbol)

;;see row and column
(column-number-mode t)
(line-number-mode t)

;;windows style scrolling
(setq scroll-step 1)

;;set a default directory to save backups to
(setq backup-directory-alist '(("." . "~/.emacsbackup")))

;;create numbered backups
(setq version-control t)

;;spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;ditch the menu bar
(menu-bar-mode 0)

;;see row and column
(column-number-mode t)
(line-number-mode t)

;;tab width stuff
(set-default 'tab-width 4)


;;change tabs to 4 characters in php and c
;(autoload 'php-mode "~/.emacs.d/php-mode" nil t)
;;(require 'php-mode)
(defun my-php-mode-hook ()
 (setq tab-width 4))
(add-hook 'php-mode-hook 'my-php-mode-hook)
(setq-default c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'psvn)
(setq svn-status-verbose nil)

;; CSS mode
(setq auto-mode-alist       
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
(setq cssm-indent-level 4)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)



 (setq auto-mode-alist       
      (cons '("\\.tpl\\'" . html-mode) auto-mode-alist))

 (setq auto-mode-alist       
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
 (setq auto-mode-alist       
      (cons '("\\.inc\\'" . php-mode) auto-mode-alist))
 (setq auto-mode-alist       
      (cons '("\\.module\\'" . php-mode) auto-mode-alist))


(setq browse-url-browser-function 'browse-url-lynx-emacs)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(grep-find-command "find . -type f -not -path \"*.svn*\" -and -not -path \"*.sql*\" -and -not -path \"*.log\" -and -not -path \"*.serialized\" -print0 | xargs -0 -e grep -n -s -F ")
 '(scroll-bar-mode (quote right))
 '(vc-make-backup-files t))
;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(font-lock-string-face ((((type tty) (class color)) (:foreground "white")))))

;;'(grep-find-ignored-directories (quote (".svn")))


;; recent mode
;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq delete-old-versions 1)



;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(global-set-key "\C-x\C-b" 'ibuffer-other-window)


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(highline-face ((t (:background "light grey" :foreground "black" :inverse-video nil)))))

; ubuntu (graphical) emacs settings
(tool-bar-mode 0)

; truncate the lines when in sql mode
(add-hook 'sql-interactive-mode-hook '(lambda() 
                                        (setq truncate-lines t)
                                        )
          )

;; ;; php mode
;; (require 'php-mode)

; highline
(require 'highline)
(highline-mode-on)


;;(require 'color-theme-gruber-darker)
;;(color-theme-gruber-darker)
;;(color-theme-hober)  
;;(color-theme-jsc-dark)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-clarity)
     )
)

; other buffer
(global-set-key "\C-o" 'other-window)


;; saveplace: save location in file when saving files
(setq save-place-file "~/.emacs.d/cache/saveplace")
(setq-default save-place t)            ;; activate it for all buffers
(require 'saveplace)                   ;; get the package



;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq php-mode-hook
          '(lambda ()
              (gtags-mode 1)
      ))

(global-set-key "\C-c\ \C-c" 'comment-region)
(global-set-key "\C-c\ \C-u" 'uncomment-region)

;; buffer move
(require 'buffer-move)


;; 
(load-library "occur")

