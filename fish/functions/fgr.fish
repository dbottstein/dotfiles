function fgr -d "Find files and grep for text"
	find $argv[2..] -type f -exec grep -iH $argv[1] {} \;
end