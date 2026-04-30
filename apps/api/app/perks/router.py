from fastapi import APIRouter

from app.perks.schemas import PerkResponse, PerkSuggestionsResponse, TravelPlanRequest
from app.perks.service import get_all_perks, suggest_perks

router = APIRouter(prefix="/perks", tags=["perks"])


@router.get("/", response_model=list[PerkResponse])
async def list_perks() -> list[PerkResponse]:
    return await get_all_perks()


@router.post("/suggest", response_model=PerkSuggestionsResponse)
async def suggest(plan: TravelPlanRequest) -> PerkSuggestionsResponse:
    perks = await suggest_perks(plan)
    return PerkSuggestionsResponse(travel_plan=plan, suggested_perks=perks)
