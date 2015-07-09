 ;; Manual Settings
(setq
	backup-directory-alist `((".*" . ,temporary-file-directory))
	auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
)

 ;; Extra package repos
(require 'package)
(push '("melpa" . "http://stable.melpa.org/packages/") package-archives)
(package-initialize)

 ;; Functions
(defun open-init-file ()
	(interactive)
	(setq bak vc-follow-symlinks)
	(setq vc-follow-symlinks nil)
	(find-file user-init-file)
	(setq vc-follow-symlinks bak)
)

 ;; Key bindings
(global-set-key (kbd "C-c C-i") 'open-init-file)
(global-set-key (kbd "C-p") 'projectile-find-file)

(projectile-global-mode)

 ;; Mode hooks
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
