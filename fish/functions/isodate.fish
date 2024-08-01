function isodate -d 'ISO date formatting'
    argparse 'u/utc' 'b/basic' -- $argv

    if set -q _flag_utc
        if set -q _flag_basic
            date -u +%Y%m%dT%H:%M:%SZ
        else
            date -u +%Y-%m-%dT%H:%M:%SZ
        end
    else if set -q _flag_basic
        date -u +%Y%m%dT%H%M%S%z
    else
        date +%Y-%m-%dT%H:%M:%S%z
    end
end