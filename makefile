all:
	@echo Run \'make install\' to install Sapphire Butler.

install:
	@#@mkdir --parents $(PREFIX)/usr/share/licenses/sapphire-butler/
	@#@cp LICENSE $(PREFIX)/usr/share/licenses/sapphire-butler/
	@mkdir --parents $(PREFIX)/usr/share/sapphire-butler
	@cp art/butler.png $(PREFIX)/usr/share/sapphire-butler/
	@cp art/butlerface.png $(PREFIX)/usr/share/sapphire-butler/
	@cp -r departments $(PREFIX)/usr/share/sapphire-butler/
	@cp -r i18n $(PREFIX)/usr/share/sapphire-butler/
	@cp taskeditor.sh $(PREFIX)/usr/share/sapphire-butler/
	@chmod +x $(PREFIX)/usr/share/sapphire-butler/taskeditor.sh
	@chmod -R a+r $(PREFIX)/usr/share/sapphire-butler
	@mkdir --parents $(PREFIX)/usr/share/applications
	@cp other/sapphire-butler-yad.desktop $(PREFIX)/usr/share/applications/
	@mkdir --parents $(PREFIX)/usr/share/pixmaps
	@cp art/butler.svg $(PREFIX)/usr/share/pixmaps/
	@cp art/butlerface.svg $(PREFIX)/usr/share/pixmaps/
	@mkdir --parents $(PREFIX)/etc/
	@cp --no-clobber other/sapphire-butler.conf $(PREFIX)/etc/
	@mkdir --parents $(PREFIX)/usr/share/man/man1/
	@cp other/butler.1 $(PREFIX)/usr/share/man/man1/
	@mkdir --parents $(PREFIX)/usr/bin
	@cp butler $(PREFIX)/usr/bin/
	@chmod +x $(PREFIX)/usr/bin/butler

uninstall:
	@rm -f $(PREFIX)/usr/bin/butler
	@rm -rf $(PREFIX)/usr/share/sapphire-butler
	@rm $(PREFIX)/usr/share/man/man1/butler.1
	@rm $(PREFIX)/usr/share/pixmaps/butler.svg
	@rm $(PREFIX)/usr/share/pixmaps/butlerface.svg
	@rm $(PREFIX)/usr/share/applications/sapphire-butler-yad.desktop
