from pydantic import BaseModel


class PerkBase(BaseModel):
    name: str
    category: str
    description: str


class PerkResponse(PerkBase):
    id: str
    eligible: bool


class TravelPlanRequest(BaseModel):
    airline: str
    origin: str
    destination: str
    is_transfer: bool = False
    booking_class: str = "economy"


class PerkSuggestionsResponse(BaseModel):
    travel_plan: TravelPlanRequest
    suggested_perks: list[PerkResponse]
