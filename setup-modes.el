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
(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))


(provide 'setup-modes)
