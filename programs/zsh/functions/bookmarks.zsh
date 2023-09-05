bookmarks() {
    buku -p -f 40 | fzf --header="Select bookmark to open:" \
        --height="50%" \
        --exit-0 \
        --bind 'enter:become(echo {1})+abort' 
}

if selection=$( bookmarks ); then
  exec brave $selection
fi
