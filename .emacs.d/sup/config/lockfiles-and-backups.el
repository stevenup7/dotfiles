(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-filename-transfors `((".*" ,temporary-file-directory t)))
