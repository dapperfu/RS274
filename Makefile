VENV?=.venv
PIP=${VENV}/bin/pip

.DEFAULT: all
.PHONY: all
all: venv

.PHONY: venv
venv: ${VENV}

${VENV}:
	python3 -mvenv ${@}

.PHONY: pip
pip: ${VENV}
	${PIP} install -U pip setuptools wheel


#https://stackoverflow.com/questions/10168449/git-update-submodule-recursive
#TODO: Improve this
.PHONY: submodules
submodules:
	git submodule init
	git submodule update
	git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin; git submodule update --recursive; git clean -dfx'
