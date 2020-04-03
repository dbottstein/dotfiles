export MAVEN_OPTS='-Xmx1G -Djava.awt.headless=true'

alias -- war='mvn compile war:exploded'

mvn5 () { JAVA_HOME=$JAVA5_HOME MAVEN_OPTS=-Xmx768m mvn $* }
