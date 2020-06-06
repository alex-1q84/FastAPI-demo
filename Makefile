init:
	python3 -m venv venv
	./venv/bin/python3 -m pip install -r src/requirements.txt

test:
	cd src; pytest .

run:
	cd src; uvicorn app.main:app --reload --workers 1 --host 0.0.0.0 --port 8000

db:
	docker-compose -f pgsql.yml up -d

clean:
	rm -rf venv
