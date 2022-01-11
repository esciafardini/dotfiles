(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(treemacs-all-the-icons
 evil-goggles scss-mode evil-numbers use-package evil-collection
 flycheck-clj-kondo yasnippet lsp-treemacs evil-leader
 evil-nerd-commenter lispyville simpleclip cider key-chord
 clojure-mode yaml-mode web-mode lsp-ui lsp-mode json-mode
 js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company
 counsel swiper ivy exec-path-from-shell zop-to-char
 zenburn-theme which-key volatile-highlights undo-tree super-save
 smartrep smartparens operate-on-number nlinum move-text magit
 projectile imenu-anywhere hl-todo guru-mode git-modes
 git-timemachine gist flycheck expand-region epl editorconfig
 easy-kill diminish diff-hl discover-my-major crux
 browse-kill-ring anzu ag ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Rainbow Delimiters For Clojure
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurec-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)

;;Disable Pink Highlighter Warning
(setq prelude-whitespace nil)

;;Disregard .gitignore Files With Fuzzy Finder
(setq projectile-use-git-grep t)

;;Remap Meta Key
(setq mac-command-modifier 'none
      mac-option-modifier 'meta)

;;; custom.el ends here
