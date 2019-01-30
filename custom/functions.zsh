function reload(){
    for server in $(ls $HOME/Ansible/.vagrant/machines/); do
        /usr/bin/vagrant reload $server
    done
}

function ltx(){
    filename=$(basename $1 .tex)
    /usr/bin/latex $1
    gvfs-open ${filename}.dvi
}

function c(){
    count_path=$pwd
    [ $# != 0 ] && count_path=$1
    printf "In : ll $count_path | wc -l\n"
    printf "Out: $(ll $count_path | wc -l)\n"
}

function ignore(){
    echo $1 >> .gitignore
    cat .gitignore
}

# Perl grep, because 'grep -P' is terrible. Lets you work with pipes or files.
prep() { # [pattern] [filename unless STDOUT]
    perl -nle 'print if /'"$1"'/i;' $2
}

function gt(){
    tar zcvf $1.tgz --remove-files $1
}
