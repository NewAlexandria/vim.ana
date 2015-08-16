SCRIPT=$(wildcard plugin/*.vim)
AUTOL =$(wildcard autoload/*.vim)
DOC=$(wildcard doc/*.txt)
CVIM=$(wildcard contrib/*)
PLUGIN=$(shell basename "$$PWD")
VERSION=$(shell sed -n '/Version:/{s/^.*\(\S\.\S\+\)$$/\1/;p}' $(SCRIPT))

.PHONY: test

all: vimball

vimball: $(SCRIPT) $(AUTOL) $(DOC) $(PLUGIN).vmb
	rm -f $(PLUGIN)-$(VERSION).vmb
	vim -N -u NONE -c 'ru! plugin/vimballPlugin.vim' -c ':call append("0", [ "$(SCRIPT)", "$(AUTOL)", "$(DOC)", "$(CVIM)"])' -c '$$d' -c ":%MkVimball $(PLUGIN)-$(VERSION)  ." -c':q!'
	ln -f $(PLUGIN)-$(VERSION).vmb $(PLUGIN).vmb

clean:
	find . -type f \( -name "*.vba" -o -name "*.orig" -o -name "*.~*" \
	-o -name ".VimballRecord" -o -name ".*.un~" -o -name "*.sw*" -o \
	-name tags -o -name "*.vmb" \) -delete

dist-clean: clean

install:
	vim -N -u NONE -c'ru! plugin/vimballPlugin.vim' -c':so %' -c':q!' $(PLUGIN)-$(VERSION).vmb

uninstall:
	vim -N -u NONE -c 'ru! plugin/vimballPlugin.vim' -c':RmVimball' -c':q!' $(PLUGIN)-$(VERSION).vmb

undo:
	for i in */*.orig; do mv -f "$$i" "$${i%.*}"; done

release: version all

version:
	perl -i.orig -pne 'if (/Version:/) {s/\.(\d*)/sprintf(".%d", 1+$$1)/e}' ${SCRIPT} ${AUTOL}
	perl -i -pne 'if (/GetLatestVimScripts:/) {s/(\d+)\s+:AutoInstall:/sprintf("%d :AutoInstall:", 1+$$1)/e}' ${SCRIPT}  ${AUTOL}
	#perl -i -pne 'if (/Last Change:/) {s/\d+\.\d+\.\d\+$$/sprintf("%s", `date -R`)/e}' ${SCRIPT}
	perl -i -pne 'if (/Last Change:/) {s/(:\s+).*\n/sprintf(": %s", `date -R`)/e}' ${SCRIPT} ${AUTOL}
	perl -i.orig -pne 'if (/Version:/) {s/\.(\d+).*\n/sprintf(".%d %s", 1+$$1, `date -R`)/e}' ${DOC}
	VERSION=$(shell sed -n '/Version:/{s/^.*\(\S\.\S\+\)$$/\1/;p}' $(SCRIPT))

test:
	cd test && ./run_test.sh
