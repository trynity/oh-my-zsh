eval "$(npm completion 2>/dev/null)"

# npm exec : For "bundler exec" similar functionality
function npm() {
	if [[ $1 == "exec" ]]; then
		PATH="$(command npm bin):$PATH" $*[2,-1];
	else
		command npm $*[2,-1];
	fi;
}
