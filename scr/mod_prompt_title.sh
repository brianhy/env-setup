# Update the title of the windows to the passed in string
prtitle() {
    echo -e "\033]2;$1\007"
}
