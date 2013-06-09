eval "$(npm completion 2>/dev/null)"

# npm exec : For "bundler exec" similar functionality
function npm() {
	if [[ $1 == "exec" ]]; then
		PATH="$(command npm bin):$PATH" $*[2,-1];
	else
		command npm $*[1,-1];
	fi;
}
# Install and save to dependencies
alias npms="npm i -S "

# Install and save to dev-dependencies
alias npmd="npm i -D "

# npm exec : For "bundler exec" similar functionality
function npm() {
	if [[ $1 == "exec" ]]; then
		PATH="$(command npm bin):$PATH" $*[2,-1];
	else
		command npm $*[2,-1];
	fi;
}
>>>>>>> Add "npm exec" a la "bundle exec" for node projects
