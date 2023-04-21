function fd -d "Find directory"
    if command -q fd
        command fd --follow --type d $argv
    else
	    find . -type d -name $argv
	end
end