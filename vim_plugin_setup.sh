BASE=$HOME/.vim
BUNDLE=$HOME/.vim/bundle/

# Workers

function setup_custom_colours {
    COLORS=$BASE/colors
    mkdir -p $COLORS

    TMP=$(mktemp -d)
    git clone https://github.com/zefei/simple-dark $TMP
    mv $TMP/colors/simple-dark.vim $COLORS
    /bin/rm -rf $TMP
}

function git_clone_or_pull() {
    echo '\n --------------- Repo for '$2
    if [ -d $BUNDLE/$2 ]
    then
        echo "==Repo exists"
        ( cd $BUNDLE/$2 && git pull )
    else
        echo "==Repo doesn't exist"
        ( cd $BUNDLE && git clone $3 $1; )
    fi
}

function check_bundle_path_or_create() {
    if [ -d $BUNDLE ]
    then
        echo "Dir for bundle exists" 
    else
        echo "Creating dir"
        mkdir $BUNDLE
    fi
}

function update_bundles {
    git_clone_or_pull "https://github.com/kien/ctrlp.vim.git" "ctrlp.vim"
    git_clone_or_pull "https://github.com/scrooloose/nerdtree.git" "nerdtree"
    git_clone_or_pull "https://github.com/easymotion/vim-easymotion" "vim-easymotion"
    git_clone_or_pull "https://github.com/davidhalter/jedi-vim.git" "jedi-vim" --recursive
}

function setup_pathogen {
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

# Commands
setup_custom_colours
check_bundle_path_or_create && update_bundles
setup_pathogen
