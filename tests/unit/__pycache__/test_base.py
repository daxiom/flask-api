from http import HTTPStatus


def test_base(client):
    rv = client.get("/")

    assert rv.status_code == HTTPStatus.OK
