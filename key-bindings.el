;; JDEE completion
(global-set-key (kbd "C-.") 'jde-complete-minibuf)

;; Multiple cursors
(global-set-key (kbd "C-d") 'mc/mark-all-dwim)

;; Expand region
(global-set-key (kbd "C-&") 'er/expand-region)




(global-set-key (kbd "M-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-<") 'mc/edit-beginnings-of-lines)

;; Mark additional regions matching current region
(global-set-key (kbd "C-S-d") 'mc/mark-all-symbols-like-this)


;; (global-set-key (kbd "C-&") '(lambda (begin end)
;; 			       (interactive)
;; 			       (if (use-region-p)
;; 				   (mc/mark-next-like-this)
;; 				 (er/expand-region))))


(provide 'key-bindings)

;; autopair ?
