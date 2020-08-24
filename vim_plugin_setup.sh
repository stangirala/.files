BASE=$HOME/.vim

# Workers
function git_clone_or_pull() {
    if cd $BUNDLE/$2; then git pull; else git clone $3 $1; fi
}

function setup_custom_colours {
    COLORS=$BASE/colors
    TMP=$(mktemp -d)
    git clone https://github.com/zefei/simple-dark $TMP
    mv $TMP/colors/simple-dark.vim $COLORS
    /bin/rm -rf $TMP
}

function update_bundles {
    BUNDLE=$HOME/.vim/bundle/
    git_clone_or_pull "https://github.com/kien/ctrlp.vim.git" "ctrlp.vim"
    git_clone_or_pull "https://github.com/scrooloose/nerdtree.git" "nerdtree"
    git_clone_or_pull "https://github.com/easymotion/vim-easymotion" "vim-easymotion"
    git_clone_or_pull "https://github.com/davidhalter/jedi-vim.git" "jedi-vim" --recursive
}

# Commands
setup_custom_colours
update_bundles
