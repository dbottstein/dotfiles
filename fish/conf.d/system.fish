switch (uname -s)
    case 'Linux*'
        set -g system linux
    case 'Darwin*'
        set -g system macos
    case 'CYGWIN*'
        set -g system cygwin
    case 'MINGW*'
        set -g system mingw
    case '*'
        set -g system unknown
end
