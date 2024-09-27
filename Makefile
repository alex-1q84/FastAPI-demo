VENVPATH = venv/bin
PYTHON = $(VENVPATH)/python3
PYTEST = $(VENVPATH)/pytest
UVICORN = $(VENVPATH)/uvicorn

init:
	python3 -m venv venv
	$(PYTHON) -m pip install -r src/requirements.txt

upgrade:
	$(PYTHON) -m pip install --upgrade -r src/requirements.txt

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
