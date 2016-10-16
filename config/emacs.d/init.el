;; Key Bindings
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-z C-a") 'global-auto-complete-mode)
(global-set-key (kbd "C-z b") 'buffer-menu)
(global-set-key (kbd "C-z C-c") 'customize)
(global-set-key (kbd "C-z d") 'open-dired)
(global-set-key (kbd "C-z C-d") 'projectile-dired)
(global-set-key (kbd "C-z f") 'helm-recentf)
(global-set-key (kbd "C-z C-f") 'rgrep)
(global-set-key (kbd "C-z i") 'open-init-file)
(global-set-key (kbd "C-z C-i") 'open-royal-init-file)
(global-set-key (kbd "C-z C-n") 'open-royal-neko-dir)
(global-set-key (kbd "C-z C-p") 'neko-open-project)
(global-set-key (kbd "C-z C-r") 'revert-buffer)
(global-set-key (kbd "C-z C-s") 'switch-to-scratch)
(global-set-key (kbd "C-z C-w") 'whitespace-mode)
(global-set-key (kbd "C-z w") 'whitespace-cleanup)

(global-set-key (kbd "C-z SPC") 'auto-complete)

(global-set-key (kbd "C-z C-o") 'open-line-backwards)
(global-set-key (kbd "C-x )") 'kmacro-end-or-call-macro)

;; Overrides
(global-set-key (kbd "C-a") 'neko-move-beginning)
(global-set-key (kbd "C-n") 'goto-line)
(global-set-key (kbd "C-o") 'open-line-forwards)
(global-set-key (kbd "C-r") 'replace-string)

(defun open-init-file ()
  (interactive)
  (setq defaultVal vc-follow-symlinks
        vc-follow-symlinks nil)
  (find-file user-init-file)
  (setq vc-follow-symlinks defaultVal))

(defun open-royal-init-file ()
  (interactive)
  (setq defaultVal vc-follow-symlinks
        vc-follow-symlinks nil)
  (find-file "~/royal-neko/config/emacs.d/init.el")
  (setq vc-follow-symlinks defaultVal))

;; Manual Settings
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Extra Package Repos
(require 'package)
(push '("melpa" . "http://melpa.org/packages/") package-archives)
(package-initialize)

;; Package list - figure out how to turn this into a command
(setq neko-package-list '(
  auto-complete
  avy
  helm
  helm-swoop
  js2-mode
  js2-refactor
  key-chord
  magit
  projectile
  yasnippet))

(when (require 'avy nil t)
  (global-set-key (kbd "C-f") 'avy-goto-word-1)
  (global-set-key (kbd "C-c SPC") 'avy-goto-char)
  (global-set-key (kbd "C-c C-SPC") 'avy-goto-char))

(when (require 'helm nil t)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-z C-h") 'helm-apropos)
  (global-set-key (kbd "C-z C-m") 'helm-imenu))

(when (require 'helm-swoop nil t)
  (global-set-key (kbd "C-z s") 'helm-swoop))

(when (require 'key-chord nil t)
  (setq key-chord-two-keys-delay 0.05)
  (global-set-key (kbd "C-z C-k") 'key-chord-mode)

  (key-chord-define-global "qw" 'whitespace-mode)
  (key-chord-define-global "l;" 'goto-line)

  (key-chord-define-global "oi" 'open-line-backwards)
  (key-chord-define-global "op" 'open-line-forwards))

(when (require 'magit nil t)
  (global-set-key (kbd "C-z C-g") 'magit-status))

(when (require 'projectile nil t)
  (global-set-key (kbd "C-p") 'projectile-find-file)
  (global-set-key (kbd "C-z p") 'neko-find-file-in-directory)
  (global-set-key (kbd "C-M-p") 'projectile-find-file-other-window)
  (global-set-key (kbd "C-z C-x") 'run-index)
  (global-set-key (kbd "C-z x") 'run-script-prompt))

(when (require 'js2-refactor nil t)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(when (require 'yasnippet nil t)
  (global-set-key (kbd "C-z C-y") 'yas-insert-snippet)
  (global-set-key (kbd "C-z y") 'neko-yas-menu)
  (global-set-key (kbd "C-z M-y") 'yas-new-snippet))

;; Functions
(defun install-neko-packages ()
  (interactive)
  (list-packages)
  (dolist (package neko-package-list)
    (unless (require package nil t)
      (package-install package))))

(defun open-line-forwards ()
  (interactive)
  (move-end-of-line nil)
  (newline))

(defun open-line-backwards ()
  (interactive)
  (move-beginning-of-line nil)
  (newline)
  (previous-line))

(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))

(defun open-royal-neko-dir ()
  (interactive)
  (find-file "~/royal-neko"))

(defun neko-find-file-in-directory ()
  (interactive)
  (projectile-find-file-in-directory default-directory))

(defun switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun neko-open-project ()
  (interactive)
  (setq project-name (helm
                       :sources
                       (helm-build-sync-source "projects"
                         :candidates
                         (directory-files "~/projects" nil "^[^\\.]"))))
  (if project-name
      (dired (concat "~/projects/" project-name))))

(defun run-index ()
  (interactive)
  (run-script (concat (projectile-project-root) "bin/index")))

(defun run-script-prompt ()
  (interactive)
  (setq project-bin-dir
        (concat (projectile-project-root) "bin/"))
  (setq script-path
        (concat project-bin-dir
                (helm
                  :sources
                  (helm-build-sync-source "scripts"
                    :candidates
                    (directory-files project-bin-dir nil "^[^\\.]")))))
  (run-script script-path))

(defun run-script (script-path)
  (async-shell-command
    script-path
    (concat "*Async >> " script-path)))

(defun open-dired ()
  (interactive)
  (dired default-directory))

(defun neko-move-beginning ()
  (interactive)
  (setq before (point))
  (move-beginning-of-line nil)
  (if (= before (point))
      (back-to-indentation)))

(defun neko-yas-menu ()
  (interactive)
  (yas-describe-tables)
  (other-window 1)
  (beginning-of-buffer))

;; Mode Hooks - Use this later?
;; (add-hook 'text-mode-hook 'edit-mode-hook-fn)
;; (add-hook 'prog-mode-hook 'edit-mode-hook-fn)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (defun edit-mode-hook-fn ()
;;   (linum-mode)
;; )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu nil)
 '(ac-auto-start nil)
 '(async-shell-command-buffer (quote confirm-kill-process))
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(global-auto-complete-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(helm-mode t)
 '(indent-tabs-mode nil)
 '(linum-format "%d ")
 '(magit-fetch-arguments (quote ("--prune")))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-push-arguments (quote ("--set-upstream")))
 '(projectile-completion-system (quote helm))
 '(projectile-global-mode t)
 '(projectile-require-project-root nil)
 '(recentf-mode t)
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
