;;; smart-mode-line-powerline2-theme.el --- an alternate powerline theme for
;;;                                         smart-mode-line

;; Original powerline theme and smart-mode-line are by Artur Malabarba
;; http://github.com/Bruce-Connor/smart-mode-line
;; maintained by plu5 http://github.com/plu5/smart-mode-line-powerline2
;; Package-Requires: ((emacs "24.3") (powerline "2.2") (smart-mode-line "2.5"))

;;; License:
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;

;;; Code:

(deftheme smart-mode-line-powerline2
	"an alternate powerline theme for smart-mode-line")
(require 'powerline)

(set-face-attribute 'powerline-active2 nil :inherit 'sml/global)
(set-face-attribute 'powerline-active1 nil :inherit 'sml/global)
(let ((l-inactive (face-background 'mode-line-inactive))
      (l0 (face-background 'mode-line))
      (l3 (or (face-background 'powerline-active1) "grey22"))
      (l8 (or (face-background 'powerline-active2) "grey40"))
      (separator-left
       '(intern (format "powerline-%s-%s"
                        (powerline-current-separator)
                        (car powerline-default-separator-dir))))
      (separator-right
       '(intern (format "powerline-%s-%s"
                        (powerline-current-separator)
                        (cdr powerline-default-separator-dir))))
      (separator-height '(window-mode-line-height)))
  (custom-theme-set-faces
   'smart-mode-line-powerline2
   `(mode-line-buffer-id ((t :inherit sml/filename :foreground nil :background nil)))
   `(mode-line-inactive ((t :box (:line-width -8 :color ,l-inactive))))
   `(mode-line ((t :background ,l0)))
   `(sml/global    ((t :foreground "grey50" :inverse-video nil)))

   ;; Layer 0
   `(sml/line-number         ((t :foreground "grey10" :inherit sml/global :weight bold :background ,l0)))
   `(sml/remote              ((t :inherit sml/global :background ,l0)))
   `(sml/col-number          ((t :inherit sml/global :foreground "grey20" :background ,l0)))
   `(sml/numbers-separator   ((t :inherit sml/col-number :background ,l0)))
   `(sml/client              ((t :inherit sml/prefix :background ,l0)))
   `(sml/mule-info           ((t :inherit sml/global :background ,l0)))
   `(sml/not-modified        ((t :inherit sml/global :background ,l0)))
   '(sml/read-only           ((t :inherit sml/not-modified :foreground "Cyan")))

   ;; 3
   `(sml/prefix     ((t :background ,l3 :inherit sml/global :foreground "#bf6000" :weight bold)))
   `(sml/projectile ((t :inherit sml/prefix)))
   `(sml/filename   ((t :background ,l3 :inherit sml/global :foreground "black" :weight bold)))
   `(sml/sudo       ((t :background ,l3 :inherit sml/outside-modified)))
   `(sml/git        ((t :background ,l3 :inherit (sml/read-only sml/prefix))))
   `(sml/folder     ((t :background ,l3 :inherit sml/global :weight normal :foreground "black")))

   ;; 8
   `(sml/name-filling        ((t :background ,l8 :inherit sml/prefix :weight normal)))
   `(sml/position-percentage ((t :background ,l8 :inherit sml/prefix :weight normal :foreground "#330000")))
   `(sml/modes               ((t :background ,l8 :inherit sml/global :foreground "black")))
   `(sml/process             ((t :background ,l8 :inherit sml/prefix)))
   `(sml/vc                  ((t :background ,l8 :inherit sml/git :foreground "#0000aa")))
   `(sml/vc-edited           ((t :background ,l8 :inherit sml/prefix :foreground "#330000")))

   ;; 3
   ;; minor modes
   `(sml/minor-modes         ((t :inherit sml/folder)))

   ;; 0
   `(sml/discharging         ((t :background ,l0 :inherit sml/global :foreground "Red")))
   `(sml/time                ((t :background ,l0 :inherit sml/global)))

   `(persp-selected-face ((t :foreground "ForestGreen" :inherit sml/filename)))
   `(helm-candidate-number ((t :foreground nil :background nil :inherit sml/filename))))
  (custom-theme-set-variables
   'smart-mode-line-powerline2
   '(sml/mode-width 'right 'full)
   `(sml/pre-id-separator
     '(""
       (:propertize " " face sml/global)
       (:eval (propertize " " 'display (funcall ,separator-left nil
                                                'powerline-active1
                                                ,separator-height)))
       (:propertize " " face powerline-active1)))
   `(sml/pos-id-separator
     '(""
       (:propertize " " face powerline-active1)
       (:eval (propertize " " 'display (funcall ,separator-left
                                                'powerline-active1
                                                'powerline-active2
                                                ,separator-height)))
       (:propertize " " face powerline-active2)))
   `(sml/pre-minor-modes-separator
     '("" (:propertize " " face powerline-active2)
       (:eval (propertize " " 'display (funcall ,separator-right
                                                'powerline-active2
                                                'powerline-active1
                                                ,separator-height)))
       (:propertize " " face powerline-active1)))
   `(sml/pos-minor-modes-separator
     '("" (:propertize " " face powerline-active1)
       (:eval (propertize " " 'display (funcall ,separator-right
                                                'powerline-active1 nil
                                                ,separator-height)))
       (:propertize " " face sml/global)))
   '(sml/pre-modes-separator
     (propertize " " 'face 'sml/modes))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'smart-mode-line-powerline2)
;;; smart-mode-line-powerline2-theme.el ends here
