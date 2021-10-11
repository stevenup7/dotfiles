(require 'python-black)
(require 'anaconda-mode)


(defun sup/json-clean-buffer ()
  "Cleans up json files (save-excursion is not working but it does not mess up
the field ordering"
  (interactive)
  (save-excursion
    (json-pretty-print (point-min) (point-max))
    )
  )


(defun sup/cleanup-buffer ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  ; python run black buffer because you should
  (if (eq major-mode 'python-mode)
      (python-black-buffer))

  ; json-clean-up file
  (if (eq major-mode 'json-mode)
      (sup/json-clean-buffer))

  (untabify (point-min) (point-max))

  (if (eq major-mode 'markdown-mode)
      (message "markdown") ; skip trailing whitespace
    (delete-trailing-whitespace)
    )

  (set-buffer-file-coding-system 'utf-8))

;; Various superfluous white-space. Just say no.
(add-hook 'before-save-hook 'sup/cleanup-buffer)
