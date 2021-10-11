;;; Key bindings

;; jump to the first letter of a word
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "M-?") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-i") 'indent-whole-buffer)
(global-set-key (kbd "<M-up>") 'er/expand-region)
(global-set-key (kbd "<M-down>") 'er/contract-region)
(global-set-key (kbd "C-M-k") 'kill-whole-line)
