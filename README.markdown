## Aquamacs Emacs Starter Kit

Forked from Phil Hagelberg's
[emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/),
but slimmed down for use with the already heavily customized Aquamacs
Mac OS X version of emacs.

The Starter Kit should provide a saner set of defaults than you get
normally with Emacs. It was originally intended for beginners, but it
should provide a reasonable working environment for anyone using Emacs
for dynamic languages. It also bundles a number of useful libraries
that are not distributed with Emacs for various reasons.

The latest version is at http://github.com/bashu/aquamacs-starter-kit/

## Learning

This won't teach you Emacs, but it'll make it easier to get
comfortable. To access the tutorial, press control-h followed by t.

You may also find the [PeepCode Meet Emacs
screencast](http://peepcode.com/products/meet-emacs) helpful. The
[Emacs Wiki](http://emacswiki.org) is also very handy.

## Installation

1. cd ~/Library/Preferences/Aquamacs Emacs/
2. git clone git://github.com/bashu/aquamacs-starter-kit.git
3. add the following to ~/Library/Preferences/Aquamacs Emacs/Preferences.el

       ;; This is the Aquamacs Preferences file.
       ;; Add Emacs-Lisp code here that should be executed whenever
       ;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
       ;; evaluating this file and print errors in the *Messags* buffer.
       ;; Use this file in place of ~/.emacs (which is loaded as well.)

       ;; Aquamacs Emacs Starter Kit
       ;; set the dotfiles-dir variable to this directory
       (setq kitfiles-dir (concat (file-name-directory
                    (or (buffer-file-name) load-file-name)) "/aquamacs-starter-kit"))

       ;; set up our various directories to load
       (add-to-list 'load-path kitfiles-dir)
       (require 'init)

4. Launch Aquamacs!

If you find yourself missing some autoloads after an update (which
should manifest itself as "void function: foobar" errors) try M-x
regen-autoloads. After some updates an M-x recompile-init will be
necessary; this should be noted in the commit messages.

## Structure

The init.el file is where everything begins. It's the first file to
get loaded. The starter-kit-* files provide what I consider to be
better defaults, both for different programming languages and for
built-in Emacs features like bindings or registers.

Files that are pending submission to ELPA are bundled with the starter
kit under the directory elpa-to-submit/. The understanding is that
these are bundled just because nobody's gotten around to turning them
into packages, and the bundling of them is temporary. For these
libraries, autoloads will be generated and kept in the loaddefs.el
file. This allows them to be loaded on demand rather than at startup.

There are also a few files that are meant for code that doesn't belong
in the Starter Kit. First, the user-specific-config file is the file
named after your user with the extension ".el". In addition, if a
directory named after your user exists, it will be added to the
load-path, and any elisp files in it will be loaded. Finally, the
Starter Kit will look for a file named after the current hostname
ending in ".el" which will allow host-specific configuration. This is
where you should put code that you don't think would be useful to
everyone. That will allow you to merge with newer versions of the
starter-kit without conflicts.

## Emacs Lisp Package Archive

Libraries from [ELPA](http://tromey.com/elpa) are preferred when
available since dependencies are handled automatically, and the burden
to update them is removed from the user. In the long term, ideally
everything would be installed via ELPA, and only package.el would need
to be distributed with the starter kit. (Or better yet, package.el
would come with Emacs...) See starter-kit-elpa.el for a list of
libraries that are pending submission to ELPA. Packages get installed
in the elpa/ directory.

There's no vendor/ directory in the starter kit because if an external
library is useful enough to be bundled with the starter kit, it should
be useful enough to submit to ELPA so that everyone can use it, not
just users of the starter kit.

Sometimes packages are removed from the Starter Kit as they get added
to ELPA itself. This has occasionally caused problems with certain
packages. If you run into problems with such a package, try removing
everything from inside the elpa/ directory and invoking M-x
starter-kit-elpa-install in a fresh instance.

