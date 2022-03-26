function sdk -d "Software Development Kit Manager"
    if test -e $SDKMAN_DIR/bin/sdkman-init.sh
        bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh && sdk $argv"

        if string match "install|uninstall|i|rm" "$argv[1]"
            # remove candidate paths from PATH and re-add them
            set --local length (count $PATH)
            for x in (seq $length)
                set --local i (math "$length - ($x - 1)")
                string match --quiet "$SDKMAN_DIR"\* "$PATH[$i]"; and set --erase PATH[$i]
            end

            set --local paths (string match "$SDKMAN_DIR"\* (bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; echo \$PATH" | string split ":"))
            for x in $paths
                fish_add_path --path --append $x
            end
        end
    end
end
