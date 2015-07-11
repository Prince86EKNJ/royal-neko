;; Manual Settings
(setq
	backup-directory-alist `((".*" . ,temporary-file-directory))
	auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
)

;; Extra Package Repos
(require 'package)
(push '("melpa" . "http://stable.melpa.org/packages/") package-archives)
(package-initialize)

;; Package list - figure out how to turn this into a command
(setq neko-package-list '(
	helm
	magit
	projectile
))

;; Package Settings
(when (require 'helm nil t)
	(helm-mode)
)

(when (require 'magit nil t)
	(global-set-key (kbd "C-x g") 'magit-status)
)

(when (require 'projectile nil t)
	(projectile-global-mode)
	(global-set-key (kbd "C-p") 'projectile-find-file)
)

;; Functions
(defun install-neko-packages ()
	(interactive)
	(dolist (package neko-package-list)
		(if (require package nil t)
			nil
			(package-install package)
		)
	)
)

(defun open-init-file ()
	(interactive)
	(setq 
		defaultVal vc-follow-symlinks
		vc-follow-symlinks nil)
	(find-file user-init-file)
	(setq vc-follow-symlinks defaultVal)
)

(defun open-line-forwards ()
	(interactive)
	(move-end-of-line nil)
	(newline)
)

(defun open-line-backwards ()
	(interactive)
	(move-beginning-of-line nil)
	(newline)
	(previous-line)
)

(defun reload-init-file ()
	(interactive)
	(load-file user-init-file)
)

;; Key Bindings
(global-set-key (kbd "C-o") 'open-line-forwards)
(global-set-key (kbd "C-S-o") 'open-line-backwards)
(global-set-key (kbd "TAB") 'self-insert-command)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-c") 'customize)
(global-set-key (kbd "C-z C-i") 'open-init-file)
(global-set-key (kbd "C-z C-r") 'reload-init-file)

;; Mode Hooks
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backward-delete-char-untabify-method nil)
 '(electric-indent-mode nil)
 '(linum-format "%d ")
 '(projectile-completion-system (quote helm))
 '(projectile-require-project-root nil)
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
