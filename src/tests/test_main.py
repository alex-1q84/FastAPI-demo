from starlette.testclient import TestClient

from app.main import app


# 这里 test_app 参数使用 conftest.py 内所提供的同名 fixture
def test_ping(test_app):
    response = test_app.get("/ping")
    assert response.status_code == 200
    assert response.json() == {"ping": "pong!"}
