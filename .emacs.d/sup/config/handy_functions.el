(defun kill-region-or-word ()
  (interactive)
  (if (region-active-p)
      (progn
        (setq beg (region-beginning) end (region-end))
        (delete-region beg end))
    (kill-word 1)))


(defun open-shell (shell-name)
  (interactive "snew shell's name: ")
  (progn
    ;; default to 1 for the name
    (when (string= shell-name "")
      (setq shell-name "1")
      )
    (shell shell-name)
    (switch-to-buffer shell-name)
    ;; run my custom emacs bashrc
    (sleep-for 1)
    (comint-send-string (current-buffer) (concat "source ~/.bashrc_emacs\r"))
    ))

(defun indent-whole-buffer ()
  (interactive)
  (save-excursion
    (beginning-of-buffer nil)
    (set-mark-command nil)
    (end-of-buffer nil)
    (indent-for-tab-command)
    ))

(defun get-curr-line ()
  "grab the current line and strip the EOL"
  (replace-regexp-in-string "[\r\n]" "" (thing-at-point 'line t)))


(defun switch-quotes-on-current-line ()
  "swaps single and double quotes on the current line"
  (interactive)
  (let* (
        (line (get-curr-line))
        (safestring "__supsafestring__")
        (fixed-line (replace-regexp-in-string safestring "\"" (replace-regexp-in-string "\"" "'" (replace-regexp-in-string "'" safestring line))))
        )
    (move-beginning-of-line nil)
    (kill-line nil)
    (insert fixed-line)
    ))

(defun remove-js-debug ()
  "removes console and debuggers from current file"
  (interactive)
  (flush-lines "^[[:space:][:blank:]]*console\.")
  (flush-lines "^[[:space:][:blank:]]*debugger")
  )


(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
