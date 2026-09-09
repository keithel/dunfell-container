SAVED_PS1="$PS1"
PS1=$(expr match "$PS1" ".*\\\\a\\\\]\(.*\)")
echo -ne "\e]0;Docker - Yocto Dunfell Container\007"
