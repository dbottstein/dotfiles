alias -- ='clear'
alias -- +='pushd'
alias -- +w='chmod +w'
alias -- +x='chmod +x'
alias -- -='popd'
alias -- -w='chmod -w'
alias -- -x='chmod -x'
alias -- aeou='xmodmap xmap.qwerty'
alias -- asdf='xmodmap xmap.dvorak'
alias -- enscriptc='enscript -2 -C -h -G -j -r --pretty-print=cpp'
alias -- fd='find . -type d -name'
alias -- ff='find . -type f -name'
alias -- grep='grep --color'
alias -- gerp='grep'
alias -- key='man -k'
alias -- l.='ls -d .*'
alias -- la='ls -a'
alias -- list='ls -l'
alias -- ll='ls -l'
alias -- ll.='ls -ld .*'
alias -- lla='ls -la'
alias -- dir='ls -la'
alias -- mkae='make'
alias -- mroe='more'
alias -- vi='vim'
alias -- serve='python -m SimpleHTTPServer 8000'

case $OSTYPE in
    cygwin*)
        alias -- firefox="/c/Program\ Files\ \(x86\)/Firefox\ Developer\ Edition/firefox"
        alias -- acroread="/c/Program\ Files\ \(x86\)/Adobe/Reader\ 10.0/Reader/AcroRd32.exe"
        alias -- git-notifier='~/.gem/ruby/gems/git-notifier-0.3.0/bin/git-notifier'
        alias -- pwd='print $PWD'
        alias -- sublime='$HOME/Applications/Sublime\ Text/sublime_text.exe'
        ;;

    darwin*)
        alias -- acroread="open -a Adobe\ Acrobat\ Reader\ DC"
        alias -- mark='open -a MacDown'
        alias -- preview='open -a Preview'
        alias -- edit='open -a BBEdit'
        alias -- bbedit='open -a BBEdit'
        alias -- quick='qlmanage -p'

        if [[ -x "${commands[gls]}" ]]; then
            alias -- gls='gls -F --color=auto'
            alias -- ls='gls'
        else
            alias -- ls='ls -FG'
        fi
        ;;
esac

if [ ${ZSH_VERSION//\./} -ge 420 ]; then
  # open browser on urls
  _browser_fts=(htm html org net com php uk de at cx nl se dk dk)
  for ft in $_browser_fts ; do alias -s $ft="open -a $BROWSER" ; done

  _editor_fts=(cpp cxx cc c hh h inl asc log txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft="open -a Preview" ; done

  _media_fts=(aac ape avi flac flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=mplayer ; done

  #read documents
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview
fi

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

aman () { cat $* | nroff -man | more }
dmalloc () { eval `dmalloc -C $*` }
findgrep () { find $1 -type f -exec grep -H $2 {} \; }
gnuclient () { gnuclient -q $* }
h () { history $* | less }
pr () { pr $* | topc | lpr }
x () { ssh -q -f $* /usr/bin/X11/xterm -ls }
xslt () { java -cp ${XALAN_HOME}/xalan.jar:${XALAN_HOME}/xercesImpl.jar:${XALAN_HOME}/xml-apis.jar:${XALAN_HOME}/serializer.jar org.apache.xalan.xslt.Process -INCREMENTAL -TEXT -IN $1 -XSL $2 -OUT $3 }
xx () { ssh -q -f $* /usr/openwin/bin/xterm -ls }
pman () { man -t $@ | open -f -a Preview }
mcd () { mkdir -p $1 && cd $1 }
