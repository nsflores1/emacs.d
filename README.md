# Personal `emacs.d` 🏡
This repository contains the setup for an Emacs configuration, mainly set up for my own personal use. It has features well suited for:
- Rust
- Common Lisp
- Python
- General editing

It works best on macOS and in a graphical frame. For best performance, use Mitsuharu's Emacs macOS port, or a pureGTK build on Linux. Currently, it works on Emacs versions `29` and `28`, tested on macOS and Debian. 
Other systems may experience issues.

## How to Install 💻
Firstly, make sure the following programs are installed:
- `python`, any version that's not `python3`
- `ripgrep` (optional)
- `git`, used by `straight.el` for managing packages
- `gcc` and `cmake`, used for `vterm` (optional)
- `fish`, used to make completion files for `eshell` (optional)
- `aspell`, used for enabling spellcheck (optional)
- Any specific language servers needed by certain modes:
  - Shell: `checkbashisms`
  - LaTeX: `texlab`
  - Common Lisp: `sbcl` (lang server broken for this language)
  - Markdown: `markdown`
  - Rust: `rust-analyzer`
  - Python: `black`
  
Ideally in a future version of this config, it would prompt you to install these, but that's currently not the case. Sorry for any frustration this may inadvertently cause.

`git clone` this into `~/.emacs.d`, then start Emacs. This will take some time on initial startup, but after the first boot this process should become substantially faster. It works on *my* machine, but I make no guarantees that this will be the case on yours!

## Things To Improve 🤔
- Fix the theming situation
- Consider using Markdown for the entire config
