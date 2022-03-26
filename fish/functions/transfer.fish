function transfer -d "Update file to transfer.sh"
	set -l file $argv
	if test -d $file
		fish -c "cd $file && zip -r -q - ." | \
		curl --progress-bar -H "Max-Days: 1" --upload-file - "https://transfer.sh/$file.zip" | tee /dev/null
	else
		curl --progress-bar -H "Max-Days: 1" --upload-file "$file" https://transfer.sh/$(basename $file) | tee /dev/null
	end
end
