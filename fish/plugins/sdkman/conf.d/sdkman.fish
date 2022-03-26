function _sdkman_install --on-event sdkman_install
    if set -q XDG_DATA_HOME
        set --universal --export SDKMAN_DIR $XDG_DATA_HOME/sdkman
    else
        set --universal --export SDKMAN_DIR ~/.sdkman
    end

    # add candidate paths to PATH
    if test -e $SDKMAN_DIR/bin/sdkman-init.sh
        set --local paths (string match "$SDKMAN_DIR"\* (bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; echo \$PATH" | string split ":"))

        for x in $paths
            fish_add_path --path --append $x
        end
    else
        echo "Run \"curl -s https://get.sdkman.io | bash\" to install sdkman"
    end
end

function _sdkman_uninstall --on-event sdkman_uninstall
    if set --query SDKMAN_DIR
        set --local length (count $PATH)
        for x in (seq $length)
            set --local i (math "$length - ($x - 1)")
            string match --quiet "$SDKMAN_DIR"\* "$PATH[$i]"; and set --erase PATH[$i]
        end
        set --erase SDKMAN_DIR
        set --erase SDKMAN_CANDIDATES_API SDKMAN_CANDIDATES_DIR SDKMAN_PLATFORM SDKMAN_VERSION
    end
end

# add candidate paths to PATH
if set --query SDKMAN_DIR; and test -e $SDKMAN_DIR/bin/sdkman-init.sh
    set --local paths (string match "$SDKMAN_DIR"\* (bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; echo \$PATH" | string split ":"))

    for x in $paths
        fish_add_path --path --append $x
    end
end
