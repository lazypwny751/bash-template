PREFIX	:= /usr/share
SRCDIR	:= $(PREFIX)/project

define setup
	mkdir -p $(SRCDIR)
	install -m 755 lib/*.sh $(SRCDIR)
endef

define remove
	rm -r $(SRCDIR)
endef

install:
	@$(setup)
	@echo "installed."

uninstall:
	@$(remove)
	@echo "uninstalled."

reinstall:
	@$(remove)
	@$(setup)
	@echo "reinstalled."

.PHONY: install, uninstall, reinstall