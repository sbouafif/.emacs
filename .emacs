;; Delete a word
(global-set-key "\C-w" 'backward-kill-word)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
(setq-default tab-width 2)

;; Line by line scrolling
(setq scroll-step 1)

;; Show line number
(global-linum-mode 1)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

;; Auto save in folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; utf8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Modes
(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))

(require 'whitespace)
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)

(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq-default js2-basic-offset 2)

(require 'sws-mode)
(autoload 'sws-mode "sws" nil t)
(require 'jade-mode)
(autoload 'jade-mode "jade" nil t)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(require 'stylus-mode)
(autoload 'sytlus-mode "stylus" nil t)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; Lintnode Syntax check
(add-to-list 'load-path "~/.emacs.d/lintnode")
(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/.emacs.d/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
(add-hook 'js-mode-hook
          (lambda ()
            (lintnode-hook)))

;; Flymake cursor
;; Nice Flymake minibuffer messages
(require 'flymake-cursor)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
