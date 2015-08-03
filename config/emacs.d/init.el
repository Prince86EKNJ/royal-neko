;; Key Bindings
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-z i") 'open-init-file)
(global-set-key (kbd "C-z C-i") 'open-royal-init-file)
(global-set-key (kbd "C-z C-c") 'customize)
(global-set-key (kbd "C-z C-f") 'helm-recentf)
(global-set-key (kbd "C-z C-n") 'open-royal-neko-dir)
(global-set-key (kbd "C-z C-p") 'open-project)
(global-set-key (kbd "C-z C-r") 'revert-buffer)
(global-set-key (kbd "C-z C-s") 'switch-to-scratch)
(global-set-key (kbd "C-z C-w") 'whitespace-mode)

(global-set-key (kbd "C-n") 'goto-line)
(global-set-key (kbd "C-o") 'open-line-forwards)
(global-set-key (kbd "C-z C-o") 'open-line-backwards)

(defun open-init-file ()
	(interactive)
	(setq
		defaultVal vc-follow-symlinks
		vc-follow-symlinks nil)
	(find-file user-init-file)
	(setq vc-follow-symlinks defaultVal)
)

(defun open-royal-init-file ()
	(interactive)
	(setq
		defaultVal vc-follow-symlinks
		vc-follow-symlinks nil)
	(find-file "~/royal-neko/config/emacs.d/init.el")
	(setq vc-follow-symlinks defaultVal)
)

;; Manual Settings
(setq
	backup-directory-alist `((".*" . ,temporary-file-directory))
	auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
)

;; Extra Package Repos
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.org/packages/") package-archives)
(package-initialize)

;; Package list - figure out how to turn this into a command
(setq neko-package-list '(
	ace-isearch
	helm
	key-chord
	magit
	projectile
	yasnippet
))

(when (require 'avy nil t)
	(global-set-key (kbd "C-f") 'avy-goto-word-1)
	(global-set-key (kbd "C-c SPC") 'avy-goto-char)
	(global-set-key (kbd "C-c C-SPC") 'avy-goto-char)
)

(when (require 'key-chord nil t)
	(key-chord-mode t)
	(setq key-chord-two-keys-delay 0.05)
	(global-set-key (kbd "C-z C-k") 'key-chord-mode)

	(key-chord-define-global "qw" 'whitespace-mode)
	(key-chord-define-global "l;" 'goto-line)

	(key-chord-define-global "oi" 'open-line-backwards)
	(key-chord-define-global "op" 'open-line-forwards)
)

(when (require 'magit nil t)
;	(global-set-key (kbd "C-x g") 'magit-status)
	(global-set-key (kbd "C-z C-g") 'magit-status)
)

(when (require 'projectile nil t)
	(global-set-key (kbd "C-p") 'projectile-find-file)
	(global-set-key (kbd "C-z C-x") 'execute-index)
)

(when (require 'yasnippet nil t)
	(global-set-key (kbd "C-z C-y") 'yas-insert-snippet)
	(global-set-key (kbd "C-z y") 'yas-describe-tables)
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

(defun open-royal-neko-dir ()
	(interactive)
	(find-file "~/royal-neko")
)

(defun switch-to-scratch ()
	(interactive)
	(switch-to-buffer "*scratch*")
)

(defun open-project ()
	(interactive)
	(dired
		(concat
			"~/projects/"
			(ido-completing-read "Project: "
				(directory-files "~/projects" nil "^[^\\.]")
			)
		)
	)
)

(defun execute-index ()
	(interactive)
	(cd (projectile-project-root))
	(async-shell-command "./bin/index")
)

;; Mode Hooks - Use this later?
;; (add-hook 'text-mode-hook 'edit-mode-hook-fn)
;; (add-hook 'prog-mode-hook 'edit-mode-hook-fn)

;; (defun edit-mode-hook-fn ()
;;   (linum-mode)
;; )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-isearch-function (quote avy-goto-word-1))
 '(async-shell-command-buffer (quote confirm-kill-process))
 '(column-number-mode t)
 '(global-ace-isearch-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(helm-mode t)
 '(linum-format "%d ")
 '(projectile-completion-system (quote helm))
 '(projectile-global-mode t)
 '(projectile-require-project-root nil)
 '(recentf-mode t)
 '(tab-width 4)
 '(truncate-lines t)
 '(yas-global-mode t nil (yasnippet))
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-added ((t (:foreground "#335533"))))
 '(magit-diff-added-highlight ((t (:foreground "#336633"))))
 '(magit-diff-removed ((t (:foreground "#553333"))))
 '(magit-diff-removed-highlight ((t (:foreground "#663333")))))
