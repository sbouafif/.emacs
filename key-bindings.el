;;;;;;;;;;;; BINDINGS ;;;;;;;;;;;;

;; Kill a word
(global-set-key "\C-w" 'backward-kill-word)

;; No tabs
(setq-default indent-tabs-mode nil)
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
(setq-default tab-width 2)

;; Line by line scrolling
(setq scroll-step 1)

;; Show line number
(global-linum-mode 1)

;; Auto refresh all buffers on file change
(global-auto-revert-mode t)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

;; 80 char column marker
(require 'whitespace)
 (setq whitespace-style '(face empty tabs lines-tail trailing))
 (global-whitespace-mode t)

;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; undo remapped
(define-key global-map (kbd "C-u") 'undo)

;; Find parent/child bracket
(global-set-key "%" 'match-paren)

;; Expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-#") 'mc/edit-lines)
(global-set-key (kbd "C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'key-bindings)
