function brew --wraps brew --description "Wrapper for brew command"
    if test -f $XDG_STATE_HOME/brew/github_api_token
        set -lx HOMEBREW_GITHUB_API_TOKEN (head -n 1 $XDG_STATE_HOME/brew/github_api_token)
    end

    command brew $argv
end