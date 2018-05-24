_java8_60=$( /usr/libexec/java_home -v 1.8.0_60 )
_java8_latest=$( /usr/libexec/java_home -v 1.8 )
_activator_old=~/Applications/activator-1.3.7-minimal/activator
_activator=~/Applications/activator-dist-1.3.10/bin/activator

alias sso="export JAVA_HOME=$_java8_60; alias -- activator=\"$_activator_old\"; cd sams/sso-server"
alias ssp="export JAVA_HOME=$_java8_60; alias -- activator=\"$_activator\"; cd sams/ssp-server"
alias sams="export JAVA_HOME=$_java8_60; alias -- activator=\"$_activator_old\"; cd sams/sams-server"
alias dms="export JAVA_HOME=$_java8_latest; alias -- activator=\"$_activator\"; cd sams/dms-server"

unset _java8_60 _java8_latest _activator _activator_old

# secure copy from QA to the production servers using a local Staging folder as a staging area.
# expects server names specified in ~/.ssh/config

deploy() {

    p=$1
    v=$2
    stage=/tmp/staging

    [ -d $stage ] || mkdir -p $stage

    case $p in
        sso-server)
            scp silver@sso-qa:/opt/sso/server/sso-server-$v.zip $stage/

            scp $stage/sso-server-$v.zip silver@sso-prod1:/opt/sso/server
            scp $stage/sso-server-$v.zip silver@sso-prod2:/opt/sso/server
            ;;

        sso-ui)
            scp silver@sso-qa:/opt/sso/ui/ssoUI-$v.tgz $stage/

            scp $stage/ssoUI-$v.tgz silver@sso-prod1:/opt/sso/ui
            scp $stage/ssoUI-$v.tgz silver@sso-prod2:/opt/sso/ui
            ;;

        ssp-server)
            scp silver@ssp-qa:/opt/ssp-server/ssp-$v.zip $stage/

            scp $stage/ssp-$v.zip silver@ssp-prod1:/opt/ssp/server
            scp $stage/ssp-$v.zip silver@ssp-prod2:/opt/ssp/server
            ;;

        ssp-ui)
            scp silver@ssp-qa:/opt/ssp/ui/sspUI-$v.zip $stage/

            scp $stage/ssp-$v.zip silver@ssp-prod1:/opt/ssp/ui
            scp $stage/ssp-$v.zip silver@ssp-prod2:/opt/ssp/ui
            ;;

        sams-server)
            scp silver@sams-qa:/opt/sams/server/sams-$v.zip $stage/

            scp $stage/sams-$v.zip silver@sams-prod1:/opt/sams/server
            scp $stage/sams-$v.zip silver@sams-prod2:/opt/sams/server
            ;;

        sams-ui)
            scp silver@sams-qa:/opt/sams/ui/samsUI-$v.tgz $stage/

            scp $stage/samsUI-$v.tgz silver@sams-prod1:/opt/sams/ui
            scp $stage/samsUI-$v.tgz silver@sams-prod2:/opt/sams/ui
            ;;

        dms-server)
            scp dms-qa:/opt/dms/server/dms-$v.zip $stage/

            scp $stage/dms-$v.zip silver@dms-prod1:/opt/dms/server
            scp $stage/dms-$v.zip silver@dms-prod2:/opt/dms/server
            ;;

        dms-ui)
            scp dms-qa:/opt/dms/ui/dmsUI-$v.tgz $stage/

            scp $stage/dmsUI-$v.tgz silver@dms-prod1:/opt/dms/ui
            scp $stage/dmsUI-$v.tgz silver@dms-prod2:/opt/dms/ui
            ;;

        *)
            echo What?
    esac

    rm -rf $stage

}
