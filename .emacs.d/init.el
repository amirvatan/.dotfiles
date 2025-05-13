;; set emacs init file
(setq user-init-file "~/.emacs.d/init.el")

;; hide splash screen 
(setq inhibit-splash-screen t)

;; set custom file for customization 
(setq custom-file "~/.emacs.d/custom-file.el")
(load custom-file)

(global-auto-revert-mode t)

;; set font 
(set-face-attribute 'default nil :font "Cousine-18");

;; fullscreen on start 
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; remove some gui stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-file-dialog nil)
(blink-cursor-mode -1)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; adding line numbers 
(global-display-line-numbers-mode)


;; load theme 
(load-theme 'gruber-darker)

;; show matching parentecies 
(electric-pair-mode)
(show-paren-mode 1)

;; show document on little buffer down there 
(eldoc-mode 1)

;; change yes and no to y and n
(fset 'yes-or-no-p 'y-or-n-p)

;; add repos 
(setq package-archives
	  '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		("MELPA"        . "https://melpa.org/packages/")
		("ORG"          . "https://orgmode.org/elpa/")
		("MELPA Stable" . "https://stable.melpa.org/packages/")
		("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
	  package-archive-priorities
	  '(("GNU ELPA"     . 20)
		("MELPA"        . 15)
		("ORG"          . 10)
		("MELPA Stable" . 5)
		("nongnu"       . 0)))

(package-initialize)

;; enable ido mode 
(ido-mode 1)
(ido-everywhere 1)

;; enable smex for Meta-x menu to use ido 
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


;; company auto complition
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t))
;; help to find out keybindings 
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

