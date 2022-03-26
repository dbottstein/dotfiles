function quick-look --wraps qlmanage -d "Quick open file"
    test (count $argv) -gt 0
    and qlmanage -p $argv >/dev/null 2>1 &
end
