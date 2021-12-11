;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; always ensure packages are being installed by default

(use-package counsel)

(use-package ivy
  :after counsel
  :config

  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

;; Configure emacs
(use-package emacs
  :bind (("M-/" . comment-or-uncomment-region))
  :config
  ;; GOOD LORD... disable backup and autosave! Driving me nuts...
  (setq backup-inhibited t)
  (setq auto-save-default nil)
  ;; Set up character encoding
  (set-language-environment "UTF-8")
  (prefer-coding-system       'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8)

  (setq inhibit-startup-message t) ;; don't show the startup message

  (scroll-bar-mode -1)        ; Disable visible scrollbar
  (tool-bar-mode -1)          ; Disable the toolbar
  (tooltip-mode -1)           ; Disable tooltips
  (set-fringe-mode 10)        ; Give some breathing room

  (menu-bar-mode -1)            ; Disable the menu bar

  (show-paren-mode t)

  ;; Make ESC quit prompts
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

  ;; Enable visual line mode (text wrapping) in all text-modes
  (add-hook 'text-mode-hook #'visual-line-mode)

  (column-number-mode)
  (global-display-line-numbers-mode t))

;; Helpful text to show you which keybinding calls the command
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package yasnippet
  :config
  (yas-global-mode 1) ;; enable snippets
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

;; Better helpful messaging
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package company
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;; Keybindings a la vim
(use-package evil
  :demand t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  ;; Unbind space, return and tab from evil mode to be used elsewhere
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "SPC") nil)
    (define-key evil-motion-state-map (kbd "RET") nil)
    (define-key evil-motion-state-map (kbd "TAB") nil))
  :config
  (evil-mode 1))

;; Evil keybindings for org mode
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  ;; Move to the next visual line instead of real line
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (evil-org-agenda-set-keys))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; (use-package ido
;;   :config
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-everywhere t)
;;   (ido-mode 1))

;; Org-mode
(use-package org
  :bind (("C-c o a" . org-agenda)
	 ("C-c return" . org-toggle-checkbox))
  :config
  (setq org-directory "~/org")
  ;; All files within the org-directory could have todo items that should be shown on the agenda
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  ;; The return key should follow links...
  (setq org-return-follows-link t)
  ;; What states should the todo cycle have?
  (setq org-todo-keywords
	'((sequence "TODO" "WAITING" "|" "DONE" "CANCELLED")))

  ;; startup with showing inline images
  (setq org-startup-with-inline-images t)
  ;; Automatically put the time when todo is marked done
  (setq org-log-done 'time))


;; A Zettelkasten library to keep track of note nodes
(use-package org-roam
  ;; :after org
  :demand t
  :init
  (setq org-roam-v2-ack t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c d g d" . org-roam-dailies-goto-date)
	 ("C-c d c d" . org-roam-dailies-capture-date)
	 ("C-c d g t" . org-roam-dailies-goto-today)
	 ("C-c d c t" . org-roam-dailies-capture-today)
	 :map org-mode-map
	 ("C-M-i"))
  :config
  ;; The roam directory should be within the main org directory
  (setq org-roam-directory (concat org-directory "/roam"))
  (setq org-startup-indented t)
  (org-roam-db-autosync-mode)
  (setq org-roam-completion-everywhere t)
  (org-roam-setup))

(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package web-mode
  :config
  (add-hook 'web-mode-hook
	    (function (lambda ()
			(setq evil-shift-width 2))))
  (add-to-list 'auto-mode-alist '("\\.jinja2\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django"    . "\\.jinja2\\'"))))

;; Magic git 
(use-package magit)

;; Python
(use-package python-mode)

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package emmet-mode
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any web modes
  (add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.

(use-package olivetti
  :bind (("C-c t z" . olivetti-mode))
  :config
  (setq olivetti-body-width 80))

(use-package neotree
  :bind (("C-c o n" . 'neotree-toggle)
	 ("C-c o p" . 'neotree-project-dir))
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-window-width 55) ;; neotree's width
  (setq neo-hidden-regexp-list '("^\\." "\\.cs\\.meta$" "\\.pyc$" "~$" "^#.*#$" "\\.elc$"
				 "^__pycache__$" "^.*egg-info$"))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
	  (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
	  (if (neo-global--window-exists-p)
	      (progn
		(neotree-dir project-dir)
		(neotree-find file-name)))
	(message "Could not find git project root."))))

  (add-hook 'neotree-mode-hook
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
	      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
	      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
	      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
	      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
	      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
	      (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
	      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
	      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  ;; where should projectile look for new projects?
  (setq projectile-project-search-path '("~/dev")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" default))
 '(helm-minibuffer-history-key "M-p")
 '(org-export-backends '(ascii beamer html icalendar latex md odt))
 '(org-startup-truncated t)
 '(package-selected-packages
   '(magit ivy evil-leader neotree emmet-mode web-mode markdown-mode projectile undo-fu olivetti whiteroom whiteroom-mode company evil-org python-mode doom-themes helm-config helm yasnippet yas evil-collection org-roam org-agenda evil helpful which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

