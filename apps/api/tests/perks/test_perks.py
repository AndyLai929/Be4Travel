from app.main import app
from fastapi.testclient import TestClient

client = TestClient(app)


def test_list_perks() -> None:
    response = client.get("/api/v1/perks/")
    assert response.status_code == 200
    data = response.json()
    assert len(data) == 4
    assert data[0]["id"] == "miles-accrual"


def test_suggest_perks_transfer_passenger() -> None:
    payload = {
        "airline": "Singapore Airlines",
        "origin": "HKG",
        "destination": "LHR",
        "is_transfer": True,
        "booking_class": "business",
    }
    response = client.post("/api/v1/perks/suggest", json=payload)
    assert response.status_code == 200
    data = response.json()
    assert data["travel_plan"]["airline"] == "Singapore Airlines"
    perks = data["suggested_perks"]
    assert len(perks) >= 2
    categories = [p["category"] for p in perks]
    assert "miles" in categories
    assert "stopover" in categories


def test_suggest_perks_economy_no_transfer() -> None:
    payload = {
        "airline": "Cathay Pacific",
        "origin": "HKG",
        "destination": "NRT",
        "is_transfer": False,
        "booking_class": "economy",
    }
    response = client.post("/api/v1/perks/suggest", json=payload)
    assert response.status_code == 200
    data = response.json()
    perks = data["suggested_perks"]
    for perk in perks:
        if perk["category"] == "stopover":
            raise AssertionError("Economy non-transfer should not get STPC")
    eligible_vouchers = [
        p for p in perks if p["category"] == "voucher" and p["eligible"]
    ]
    assert len(eligible_vouchers) == 0
