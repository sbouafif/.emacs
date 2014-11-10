;;;;;;;;;;;; BINDINGS ;;;;;;;;;;;;

;; Kill a word
(global-set-key "\C-w" 'backward-kill-word)

;; Line by line scrolling
(setq scroll-step 1)

;; Show line number
(global-linum-mode 1)

;; Auto refresh all buffers on file change
(global-auto-revert-mode t)

;; Goto-line short-cut key
(global-set-key "\C-l" 'goto-line)

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


;; UTF8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'key-bindings)
