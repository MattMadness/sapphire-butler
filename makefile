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
	@cp butler $(PREFIX)/usr/bin/
	@chmod +x $(PREFIX)/usr/bin/butler

uninstall:
	@rm -f $(PREFIX)/usr/bin/butler
	@rm -rf $(PREFIX)/usr/share/sapphire-butler
