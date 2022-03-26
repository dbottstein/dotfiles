function dataurl -d Create a data url from a file
	set -l MIMETYPE=$(file --mime-type $argv | cut -d ' ' -f2)
	if [[ $MIMETYPE == "text/*" ]]; then
		MIMETYPE="${MIMETYPE};charset=utf-8"
	fi
  	echo "data:${MIMETYPE};base64,$(openssl base64 -in $argv | tr -d '\n')"
end