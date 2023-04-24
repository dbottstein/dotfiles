set -gx GREP_COLOR '1;32'
set -gx GREP_OPTIONS

if eval "echo | grep --color=auto '' &> /dev/null"
	set -a GREP_OPTIONS "--color=auto"
end

# Avoid VCS folders

if eval "echo | grep --exclude-dir=.git '' &> /dev/null"
	set -a GREP_OPTIONS " --exclude-dir=.git --exclude-dir=node_modules"
else
	if eval "echo | grep --exclude=.git '' &> /dev/null"
		set -a GREP_OPTIONS "--exclude=.git --exclude=node_modules"
	end
end
