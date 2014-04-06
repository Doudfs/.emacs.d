 ;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
;;(dolist (project (directory-files site-lisp-dir t "\\w+"))
;;  (when (file-directory-p project)
;;    (add-to-list 'load-path project)))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Setup key bindings
(require 'key-bindings)

;; JDEE
(add-to-list 'load-path "~/.emacs.d/jdee/lisp")
(load "jde")

;; Monday ftw
(set-variable 'calendar-week-start-day 1)

;; No more scrolling surprises
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "M-v"))

;; No graphics please o.O
;(setq speedbar-use-images nil)

;; god-mode tweaks
;(god-mode)
;;(defun my-update-cursor ()
;;  (setq cursor-type (if (or (not god-global-mode)
;;                            god-local-mode
;;                            buffer-read-only)
;;                        'box 'bar)))

;(add-hook 'post-command-hook 'my-update-cursor)

(defun my-delete-region-and-go-to-insert-mode ()
  (delete-region (region-beginning) (region-end))
  (god-local-mode -1))

;; (define-key god-local-mode-map (kbd "'")
;; (λ (when (use-region-p)
;; (my-delete-region-and-go-to-insert-mode))))


;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

;; Emacs Lisp mode
(add-to-list 'auto-mode-alist '("\\.el\\'" . lisp-mode))

;; LaTeX mode
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))

;; C mode
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))

;; Makefile mode
(add-to-list 'auto-mode-alist '("\\Makefile\\'" . makefile-mode))

;; C++ mode
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; Perl mode
(add-to-list 'auto-mode-alist '("\\.pl\\'" . perl-mode))

;; Java mode
(add-to-list 'auto-mode-alist '("\\.java\\'" . java-mode))

;; No backups files ~ !
(setq make-backup-files nil)

;; Smooth-scrolling -> disable jump when point near top or bottom
(require 'smooth-scrolling)
