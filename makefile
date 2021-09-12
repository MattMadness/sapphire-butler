PREFIX = /usr

all:
	@echo Run \'make install\' to install Sapphire Butler.

install:
	@mkdir --parents $(PREFIX)/share/licenses/sapphire-butler/
	@cp LICENSE $(PREFIX)/share/licenses/sapphire-butler/
	@mkdir --parents $(PREFIX)/share/sapphire-butler
	@cp butler.png $(PREFIX)/share/sapphire-butler/
	@cp -r departments $(PREFIX)/share/sapphire-butler/
	@cp -r i18n $(PREFIX)/share/sapphire-butler/
	@chmod -R a+r $(PREFIX)/share/sapphire-butler
	@cp butler $(PREFIX)/bin/
	@chmod +x $(PREFIX)/bin/butler

uninstall:
	@rm -f $(PREFIX)/bin/butler
	@rm -rf $(PREFIX)/share/sapphire-butler
