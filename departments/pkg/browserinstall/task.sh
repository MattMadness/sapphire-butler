declare -a browsers=("firefox" "chromium" "brave-bin" "midori" "falkon" "vivaldi" "opera" "google-chrome" "librewolf-bin" "qutebrowser" "w3m" "lynx" "links" "surf" "otter-browser" "icecat-bin" "seamonkey" "torbrowser-launcher" "slimjet" "min" "browsh" "dot-bin" "elinks" "iridium-rpm")
browsers=($(for item in ${browsers[@]}; do echo $item; done | sort))

formatbrowserlist() {
    for browser in ${browsers[@]}; do
        echo "FALSE "
        echo "$browser "
        pikaur -Si $browser | grep "Licenses" | cut -d ':' -f2 | xargs
        pikaur -Si $browser | grep "Description" | cut -d ':' -f2 | xargs
    done
}

declare -a install=($(formatbrowserlist | yad --list --title="$taskname" --window-icon="/usr/share/sapphire-butler/butlerface.png" --geometry=800x700 --text="$yadtext" --column="Install?" --column="Name" --column="Licenses" --column="Description" --checklist | cut -d '|' -f2))
pikaur -S ${install[@]}
