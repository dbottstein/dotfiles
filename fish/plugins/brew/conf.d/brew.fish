if test -f $XDG_STATE_HOME/brew/github_api_token
    set -gx HOMEBREW_GITHUB_API_TOKEN (head -n 1 $XDG_STATE_HOME/brew/github_api_token)
end