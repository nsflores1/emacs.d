# Personal `emacs.d`
This repository contains the setup for an Emacs configuration, mainly set up for my own personal use. It has features well suited for:
- Rust
- Common Lisp
- Python
- General editing

It works best on macOS and in a graphical frame. For best performance, use Mitsuharu's Emacs macOS port, or a pureGTK build on Linux. Otherwise, things will not work as expected. Also, `git` must be installed, and for certain languages to work other packages are expected to be installed.
Currently, it works on Emacs versions `29` and `28`, tested on macOS and Debian. 
Other systems may experience issues.

## How to Install
`git clone` this into `~/.emacs.d`, then start Emacs. When you want to replace Emacs, run the script `clean.sh` in the config directory.

## Things To Improve
- Fix the theming situation
- Consider using Markdown for the entire config
