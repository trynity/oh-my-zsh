# Add Haskell's cabal bin directory to PATH
path=(${HOME}/.cabal/bin $path)

# Add Haskell Platform bin directory to PATH
path=(${HOME}/Library/Haskell/bin $path)

# Add Homebrew npm bin directory to PATH
path=(/usr/local/share/npm/bin $path)

# XQuartz
path=(/opt/X11/bin $path)

# TexLive
(($+commands[texdist])) && path+=$(texdist --current --expand)/bin/universal-darwin

# jenv
path=(${HOME}/.jenv/bin $path)
eval "$(jenv init - zsh)"

# Local bin directoies
path=(${HOME}/.bin $path)
path=(${HOME}/.local/bin $path)

# ccache for Homebrew
if [[ -e /usr/local/bin/brew ]]; then
	path+=("$(brew --prefix)/opt/ccache/libexec")
	export CCACHE_DIR="/Library/Caches/ccache"
fi

# nvm/rvm/perlbrew path reodering
nvm_paths=()
rvm_paths=()
perlbrew_paths=()
phpbrew_paths=()
jenv_paths=()
for i in $path; do
	if [[ $i  =~ ".nvm" ]]; then
		nvm_paths+=$i
	elif [[ $i =~ ".rvm" ]]; then
		rvm_paths+=$i
	elif [[ -n $PERLBREW_ROOT && $i =~ $PERLBREW_ROOT ]]; then
		perlbrew_paths+=$i
	elif [[ $i =~ ".phpbrew" ]]; then
		phpbrew_paths+=$i
	elif [[ $i =~ ".jenv" ]]; then
		jenv_paths+=$i
	fi
done

path=($rvm_paths $nvm_paths $perlbrew_paths $phpbrew_paths $jenv_paths $path)

typeset -U path
