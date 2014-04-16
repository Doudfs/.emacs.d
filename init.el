;;;;
;; Setting up load-paths and dependencies
;;;;

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;;;; For subdir too 
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;;;;
;; Require separate setup fles
;;;;

;; Load appearance setup
(require 'appearance)

;; Load key bindings
(require 'key-bindings)

;; Load modes setup
(require 'setup-modes)

;;;;
;; Setting up some usefull stuff
;;;;

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Show line numbers
(global-linum-mode 1)

;; Override selection
(delete-selection-mode 1)

;; No backups files ~ !
(setq make-backup-files nil)

;; Monday ftw
(set-variable 'calendar-week-start-day 1)

;; No more scrolling surprises
(global-unset-key (kbd "C-v"))
(global-unset-key (kbd "M-v"))

;;;;
;; Load and setup packages
;;;;

;; JDEE
(add-to-list 'load-path "~/.emacs.d/site-lisp/jdee/lisp")
(load "jde")

;; Smooth-scrolling -> disable jump when point near top or bottom
(require 'smooth-scrolling)

;; Ido ubiquitous 
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Ido Vertical
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Zencoding
(require 'zencoding-mode)

;; Multiple cursors
(require 'multiple-cursors)

;; Expand region
(require 'expand-region)

;; cc-mode
(require 'cc-mode)

;; Auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-ignore-case nil)

;; Autopair
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
