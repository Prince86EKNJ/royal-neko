(setq
	backup-directory-alist `(("." . ,temporary-file-directory))
	auto-save-file-transforms `(("." ,temporary-file-directory t))
)
