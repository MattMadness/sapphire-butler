if [ -d .git ]; then
    git add -A
    if [ $? == 0 ]; then
        read -r -p "$msgcommit" commitmessage
        if [ -n "$commitmessage" ]; then
            git commit -m "$commitmessage"
            if [ $? == 0 ]; then
                git push
            else
                butlermsg "$msgerrcommit"
            fi
        fi
    else
        butlermsg "$msgerradd"
    fi
else
    butlermsg "$dotgit"
fi