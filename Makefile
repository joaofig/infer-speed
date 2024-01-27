BIN = ./venv/bin/
PYTHON = $(BIN)python

install:
	pyenv install --skip-existing
	pyenv exec python -m venv venv
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install pip-tools
	$(BIN)pip-sync requirements/run.txt

compile:
	$(BIN)pip-compile requirements/run.in

# usage: make upgrade arg=package_to_upgrade
upgrade:
	$(BIN)pip-compile -P $(arg) requirements/run.in

sync:
	$(BIN)pip-sync requirements/run.txt
