{ config
, enabledStuff
, usefulExpresions
, lib
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.programs.emacs.enable;
    vals = {
      "emacs/init.el".text = builtins.concatStringsSep "\n" [
        ''
        (setq org-publish-project-alist
              (let* ((org-publish-path "${config.xdg.userDirs.extraConfig.XDG_PUBLISH_DIR}")
                     (org-project-path "${config.xdg.userDirs.extraConfig.XDG_ORG_DIR}")
                     (org-project-name (string-replace "/" "_" org-project-path)))
              `((,org-project-path
                 :components (,(concat org-project-name ".org")
                              ;,(concat org-project-name ".static")
                              ,(concat org-project-name ".scss-generation")))
                (,(concat org-project-name ".org")
                 :headline-levels 6
                 :recursive t
                 :base-extension "org"
                 :base-directory ,org-project-path
                 :publishing-directory ,(concat org-publish-path "/Org")
                 :publishing-function org-html-publish-to-html)
                ;(,(concat org-project-name ".static")
                 ;:recursive t
                 ;:base-extension ""
                 ;:base-directory ,org-project-path
                 ;:publishing-directory ,(concat org-publish-path "/Org")
                 ;:publishing-function org-publish-attachment)
                (,(concat org-project-name ".scss-generation")
                 :recursive t
                 :base-extension "scss"
                 :base-directory ,org-project-path
                 :publishing-directory ,(concat org-publish-path "/Org")
                 :publishing-function aru/org-scss-generation))))

        (setq mu4e-attachment-dir "${config.xdg.userDirs.extraConfig.XDG_MAIL_DIR}")

        (setq auth-source-pass-filename "${config.xdg.userDirs.extraConfig.XDG_KEYS_DIR}")

        (setq backup-directory-alist '(("." . "${config.xdg.configHome}/emacs/backup/")))
        ''
        (lib.strings.fileContents ./symlinked/init.el)
      ];
    };
  }
]
