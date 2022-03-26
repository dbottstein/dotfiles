export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

if [ "$TERM" != "dumb" ]; then
    test -r ~/.dir_colors && eval "$(gdircolors -b ~/.dir_colors)"
fi
