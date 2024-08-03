function vim --wraps vim -d "Run VIM editor"
    set --local --export VIMINIT 'source ~/.config/vim/vimrc'
    command vim $argv
end
