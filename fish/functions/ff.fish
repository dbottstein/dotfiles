function ff -d "Find file"
    if command -q fd
        command fd --follow --type f $argv
    else
        find . -type f -name $argv
	end
end