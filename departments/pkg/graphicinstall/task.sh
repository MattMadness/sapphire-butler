declare -a graphics=("gimp" "inkscape" "krita" "pix" "scribus" "typecatcher" "blender" "wings3d" "azpainter" "corepaint" "deepin-draw" "drawing" "drawpile" "gpaint" "grafx2" "imeditor" "milton" "mtpaint" "mypaint" "photoflare" "pinta" "pixelitor" "xpaint" "darktable" "filmulator" "fosstriagulator" "hugin" "lightzone" "luminancehdr" "gimp-nufraw" "oqapy" "rawstudio" "rawtherapee" "digicam" "geotag" "dia" "drawio-desktop" "dot-matrix" "figma-linux" "gravit-designer-bin" "calligra" "mockingbot" "pencil" "sk1" "svgvi" "yed" "xfig" "birdfont" "fontforge" "trufont" "enve-git" "opentoonz" "pencil2d" "qstopmotion" "scribl" "stopmotion" "synfigstudio" "tupitube" "aoi" "cloudcompare" "dust3d" "f3d" "goxel" "makehuman" "meshlab" "sweethome3d" "povray" "voxelshop" "agave" "chameleon-git" "colorgrab" "palette" "colorpicker" "color-picker" "coulr" "deepin-picker" "delicolour" "gcolor2" "gcolor3" "gpick" "kcolorchooser" "kontrast" "pick-colour-picker" "prestopalette" "xcolor" "imagemagick" "graphicsmagick" "posterazor" "image-optimizer-git" "trimage")
graphics=($(for item in ${graphics[@]}; do echo $item; done | sort))

formatgraphiclist() {
    for graphic in ${graphics[@]}; do
        echo "FALSE "
        echo "$graphic "
	graphicinfo="$(pikaur -Si $graphic)"
	echo "${graphicinfo}" | grep "Licenses" | cut -d ':' -f2 | xargs
        echo "${graphicinfo}" | grep "Description" | cut -d ':' -f2 | xargs
    done
}

declare -a install=($(formatgraphiclist | yad --list --title="$taskname" --window-icon="/usr/share/sapphire-butler/butlerface.png" --geometry=800x700 --text="$yadtext" --column="Install?" --column="Name" --column="Licenses" --column="Description" --checklist | cut -d '|' -f2))
pikaur -S ${install[@]}

