all:
	@echo Run \'make install\' to install Sapphire Butler.

install:
	@#@mkdir --parents $(PREFIX)/usr/share/licenses/sapphire-butler/
	@#@cp LICENSE $(PREFIX)/usr/share/licenses/sapphire-butler/
	@mkdir --parents $(PREFIX)/usr/share/sapphire-butler
	@cp butler.png $(PREFIX)/usr/share/sapphire-butler/
	@cp -r departments $(PREFIX)/usr/share/sapphire-butler/
	@cp -r i18n $(PREFIX)/usr/share/sapphire-butler/
	@chmod -R a+r $(PREFIX)/usr/share/sapphire-butler
	@mkdir --parents $(PREFIX)/usr/share/applications
	@cp sapphire-butler-yad.desktop $(PREFIX)/usr/share/applications/
	@mkdir --parents $(PREFIX)/usr/share/pixmaps
	@cp sapphire-butler.svg $(PREFIX)/usr/share/pixmaps/
	@mkdir --parents $(PREFIX)/etc/
	@cp --no-clobber sapphire-butler.conf $(PREFIX)/etc/
	@mkdir --parents $(PREFIX)/usr/bin
	@cp butler $(PREFIX)/usr/bin/
	@chmod +x $(PREFIX)/usr/bin/butler

uninstall:
	@rm -f $(PREFIX)/usr/bin/butler
	@rm -rf $(PREFIX)/usr/share/sapphire-butler
	@rm $(PREFIX)/usr/share/pixmaps/sapphire-butler.svg
