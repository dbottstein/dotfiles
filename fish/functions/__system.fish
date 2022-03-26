case "$(uname -s)" in
    Linux*)     echo Linux;;
    Darwin*)    echo Mac;;
    CYGWIN*)    echo Cygwin;;
    MINGW*)     echo MinGw;;
    *)          echo UNKNOWN
esac
