install: ${HOME}/bin/gitlog2changelog.sh

${HOME}/bin/gitlog2changelog.sh: gitlog2changelog.sh
	cp -i -a $? $@
	chmod +x $@
