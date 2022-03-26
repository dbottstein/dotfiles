function --wraps mkdir -d "Create a new directory and enter it"
	mkdir -p $argv; and cd $argv
end