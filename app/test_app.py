import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    rv = client.get('/')
    json_data = rv.get_json()
    assert rv.status_code == 200
    assert json_data['message'] == "Hello, World!"
