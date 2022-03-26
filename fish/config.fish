if status is-interactive
    set -gx HOMEBREW_GITHUB_API_TOKEN (cat $XDG_STATE_HOME/brew/github_api_token)
end
