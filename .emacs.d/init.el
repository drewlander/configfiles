;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(package-initialize)
;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq projectile-keymap-prefix (kbd "C-c p"))
(global-set-key (kbd "C-x w") 'elfeed)
(require 'use-package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("http://nullprogram.com/feed/" "https://www.reddit.com/r/emacs/.rss" "http://www.terminally-incoherent.com/blog/feed/" "https://www.reddit.com/r/ruby/.rss")))
 '(package-selected-packages
   (quote
    (elfeed yaml-mode all-the-icons ansible-vault ansible helm-projectile helm projectile magit smartparens smart-mode-line use-package which-key neotree doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'doom-one t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(tool-bar-mode   -1)
(scroll-bar-mode -1)

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)
(setq inhibit-startup-screen t)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default tab-width 4
              indent-tabs-mode nil)

(global-set-key (kbd "C-x k") 'kill-this-buffer)
(require 'server)
(if (not (server-running-p)) (server-start))
(setq projectile-project-search-path '("~/source/" "~/personal/"))
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "C-x C-f") #'helm-find-files)

(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "https://www.reddit.com/r/emacs/.rss"
        "http://www.terminally-incoherent.com/blog/feed/"
        "https://www.reddit.com/r/ruby/.rss"))
