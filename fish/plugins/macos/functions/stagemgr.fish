function "stagemgr" -a command -d "macOS Stage Manager"
    set -l flag ( command defaults read com.apple.WindowManager GloballyEnabled )

    switch $command
        case on
            if [ "$flag" != "1" ]
                command defaults write com.apple.WindowManager GloballyEnabled -bool true
            end
        case off
            if [ "$flag" = "1" ]
                command defaults write com.apple.WindowManager GloballyEnabled -bool false
            end
        case bounce
            if [ "$flag" = "1" ]
                command defaults write com.apple.WindowManager GloballyEnabled -bool false
                sleep 3
                command defaults write com.apple.WindowManager GloballyEnabled -bool true
            else
                command defaults write com.apple.WindowManager GloballyEnabled -bool true
            end
        case toggle
            if [ "$flag" = "1" ]
                command defaults write com.apple.WindowManager GloballyEnabled -bool false
            else
                command defaults write com.apple.WindowManager GloballyEnabled -bool true
            end
        case status
            if [ "$flag" = "1" ]
                echo "Stage Manager is enabled"
            else
                echo "Stage Manager is disabled"
            end
    end
end
