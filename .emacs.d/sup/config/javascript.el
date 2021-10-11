(require 'js2-mode)

(autoload 'js2-mode "js2" nil t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-s")



;; Tern from https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring/
;; tern for code validation and autocomplete
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

;; use this to restart tern
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))
