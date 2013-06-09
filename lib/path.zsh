# Add /usr/local/[s]bin to PATH
path=(/usr/local/bin /usr/local/sbin $path)

# Add Haskell's cabal bin directory to PATH
path=(${HOME}/.cabal/bin $path)

# Add Homebrew npm bin directory to PATH
path=(/usr/local/share/npm/bin $path)

# Add Homebrew python executables to PATH
path=(/usr/local/share/python $path)

# XQuartz
path=(/opt/X11/bin $path)

# TexLive
(($+commands[texdist])) && path+=$(texdist --current --expand)/bin/universal-darwin

# jenv
path=(${HOME}/.jenv/bin $path)

# Local bin directory
path=(${HOME}/.bin $path)

# ccache for Homebrew
path=($(brew --prefix)/Library/LinkedKegs/ccache/libexec $path)