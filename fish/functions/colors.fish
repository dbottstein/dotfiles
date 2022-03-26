function colors -d "Show 256 TERM colors"
  set -l X (tput op)
  set -l Y (printf %$((COLUMNS-6))s)
  for i in (set 0 256)
  	set -l o 00$i;
  	echo -e ${o:${#o}-3:3} $(tput setaf $i;tput setab $i)${Y// /=}$X;
  end
end
