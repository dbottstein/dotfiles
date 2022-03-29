function _brew_install --on-event brew_install
    set -l brew_paths /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin

    # Append all existing brew paths to PATH
    set -l existing_brew_paths
    for brew_path in $brew_paths
        if test -d $brew_path
            fish_add_path --prepend --path $brew_path
        end
    end
end

if test -f $XDG_STATE_HOME/brew/github_api_token
    set -gx HOMEBREW_GITHUB_API_TOKEN (head -n 1 $XDG_STATE_HOME/brew/github_api_token)
end