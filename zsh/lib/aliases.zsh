alias -- ='clear'
alias -- +='pushd'
alias -- +w='chmod +w'
alias -- +x='chmod +x'
alias -- -='popd'
alias -- -w='chmod -w'
alias -- -x='chmod -x'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- aeou='xmodmap xmap.qwerty'
alias -- asdf='xmodmap xmap.dvorak'
alias -- eclipse='eclipse -vmargs -XX:MaxPermSize=256m'
alias -- enscriptc='enscript -2 -C -h -G -j -r --pretty-print=cpp'
alias -- fd='find . -type d -name'
alias -- ff='find . -type f -name'
alias -- grep='grep --color'
alias -- gerp='grep'
alias -- key='man -k'
alias -- ls="BLOCK_SIZE=\'1 ls -F --color=auto"
alias -- l.='ls -d .*'
alias -- la='ls -a'
alias -- list='ls -l'
alias -- ll='ls -l'
alias -- lla='ls -la'
alias -- dir='ls -la'
alias -- mkae='make'
alias -- mroe='more'
alias -- play='~/Applications/play-2.2.6/play'
alias -- vi='vim'
alias -- war='mvn compile war:exploded'
alias -- postgres="sudo su postgres -c '/opt/local/lib/postgresql92/bin/postgres -D /opt/local/var/db/postgresql92/defaultdb'"
alias -- asadmin='/usr/local/glassfish/glassfish/bin/asadmin -u admin -W ${HOMEDRIVE}${HOMEPATH}/lib/glassfish-password'
alias -- serve='python -m SimpleHTTPServer 8000'
alias -- response.queue="curl -u admin:admin 'http://10.251.218.51:8161/api/jolokia/exec/org.apache.activemq:brokerName=localhost,destinationName=com.comcast.vod.servicebus.response,destinationType=Queue,type=Broker/browse()'"

case $OSTYPE in
    cygwin*)
        alias -- firefox="/c/Program\ Files\ \(x86\)/Firefox\ Developer\ Edition/firefox"
        alias -- acroread="/c/Program\ Files\ \(x86\)/Adobe/Reader\ 10.0/Reader/AcroRd32.exe"
        alias -- git-notifier='~/.gem/ruby/gems/git-notifier-0.3.0/bin/git-notifier'
        alias -- mongo="C:/Program\ Files/MongoDB/Server/3.0/bin/mongo.exe"
        alias -- mongod="C:/Program\ Files/MongoDB/Server/3.0/bin/mongod.exe"
        alias -- pwd='print $PWD'
        alias -- sublime='$HOME/Applications/Sublime\ Text/sublime_text.exe'
        ;;

    darwin*)
        alias -- acroread="open -a Adobe\ Acrobat\ Reader\ DC"
        alias -- mark='open -a MacDown'
        alias -- preview='open -a Preview'

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
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft="open -a $BROWSER" ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft="open -a Preview" ; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
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
### rlogin () { rlogin $*; chpwd }
### ssh () { command ssh $*; chpwd }
x () { ssh -q -f $* /usr/bin/X11/xterm -ls }
xslt () { java -cp ${XALAN_HOME}/xalan.jar:${XALAN_HOME}/xercesImpl.jar:${XALAN_HOME}/xml-apis.jar:${XALAN_HOME}/serializer.jar org.apache.xalan.xslt.Process -INCREMENTAL -TEXT -IN $1 -XSL $2 -OUT $3 }
xx () { ssh -q -f $* /usr/openwin/bin/xterm -ls }
pman () { man -t $@ | open -f -a Preview }
mcd () { mkdir -p $1 && cd $1 }
mvn5 () { JAVA_HOME=$JAVA5_HOME MAVEN_OPTS=-Xmx768m mvn $* }
