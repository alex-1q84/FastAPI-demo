VENV = venv
VENVPATH = $(VENV)/bin
PYTHON = $(VENVPATH)/python3
DEPENDENCY = requirements.txt
DEPENDENCY_TARGET = requirements.txt.build
PYTEST = $(VENVPATH)/pytest
UVICORN = $(VENVPATH)/uvicorn

init: $(VENV) $(DEPENDENCY_TARGET)
	$(PYTHON) -m pip install -r $(DEPENDENCY_TARGET)
	@echo "init completed"

$(VENV):
	python3 -m venv $(VENV)

$(DEPENDENCY_TARGET):
	cp $(DEPENDENCY) $(DEPENDENCY_TARGET)


upgrade:
	$(PYTHON) -m pip install --upgrade -r $(DEPENDENCY_TARGET)

test:
	cd src; ../$(PYTEST) .

run:
	cd src; ../$(UVICORN) app.main:app --reload --workers 1 --host 0.0.0.0 --port 8000

start-db:
	docker-compose -f pgsql.yml up -d

stop-db:
	docker-compose -f pgsql.yml stop

clean:
	rm -rf venv
