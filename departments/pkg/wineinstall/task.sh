pikaur --noconfirm -S wine-staging wine-gecko wine-mono lib32-libpulse lib32-alsa-lib lib32-alsa-plugins lib32-mpg123 lib32-giflib lib32-libpng lib32-gnutls lib32-gst-plugins-base lib32-gst-plugins-good samba lib32-libcups winetricks dxvk-bin wineasio
winetricks corefonts
regsvr32 /usr/lib32/wine/i386-windows/wineasio.dll
wine64 regsvr32 /usr/lib/wine/x86_64-windows/wineasio.dll