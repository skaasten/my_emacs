;; Review Board review reader helper.
;; Andrew Sutherland <asutherland@asutherland.org>
;;
;; Let's say this file is under the MPL1.1/GPL2/LGPL2.1 tri-license.
;;
;; Requirements:
;; - You need wget.
;;
;; How to install, probably:
;; 1) Put this file in a directory on your 'load-path/symlink it into there.
;;    For me this is ~/.emacs.d and I have a line like so in my .emacs:
;;    (add-to-list 'load-path "~/.emacs.d")
;; 2) Cause this file to get loaded.  I have a line like so in my .emacs:
;;    (require 'reviewboard-viewer)
;;
;; How To Use:
;; 1) Be in the root directory the patch is against in a dired-mode.
;; 2) Invoke "reviewboard-reviewer-view-review"; tab completion is your friend.
;; 3) Type the number of the review as the bugzilla export link cites.  For
;;    example, if the bugzilla export link was as follows, then you type 72:
;;    http://reviews.visophyte.org/r/bzexport/72/
;; 4) Hit enter, wait a little bit; the server does need to re-fetch the
;;    chunks for you.
;; 5) You are in a compilation-mode buffer.  You probably know how to use it
;;    better than me.  I find that meta-n/meta-p work to move between the linky
;;    things and enter causes us to try and show that thing in the other buffer.
;;
;;
;; The following were used as references while coding though I do not believe
;; this file constitutes a derivative work of them:
;;
;; * get-rfc.el by lawrence mitchell <wence@gmx.li>
;;   http://www.emacswiki.org/emacs/get-rfc.el

(defgroup reviewboard-viewer nil
  "Read Review Board Reviews within Emacs."
  :group 'convenience)

(defcustom reviewboard-viewer-reviewboard-instance
  "http://reviewboard.curvedms.org/"
  "The review board server to use."
  :group 'reviewboard-viewer
  :type 'string)

;; The reviewnum is the database ID of the review and is not the review request
;; (which we happen to force to be the bugzilla attachment id on visophyte.)  It
;; should be provided as a string.
(defun reviewboard-viewer-fetch-review (reviewnum)
  (let ((url (concat
              reviewboard-viewer-reviewboard-instance
              "r/emacsexport/" reviewnum "/"))
        (tmp-file (make-temp-file "reviewboard-viewer")))
    (call-process "wget" nil nil nil
                  url (concat "-O" tmp-file))
    tmp-file))

;;;###autoload
(defun reviewboard-reviewer-view-review (reviewnum)
  (interactive "sReview number: ")
  (let ((curdir (dired-current-directory)))
    (find-file (reviewboard-viewer-fetch-review reviewnum))
    (compilation-mode)
    (set (make-local-variable 'compilation-search-path) 
         (cons curdir ()))))

(provide 'reviewboard-viewer)
