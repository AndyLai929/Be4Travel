from app.perks.schemas import PerkResponse, TravelPlanRequest

PERKS_DB: list[dict[str, str | bool]] = [
    {
        "id": "miles-accrual",
        "name": "Miles Accrual",
        "category": "miles",
        "description": "Earn frequent flyer miles on this route",
        "eligible": True,
    },
    {
        "id": "stpc",
        "name": "Stopover for Transfer Passengers (STPC)",
        "category": "stopover",
        "description": "Free hotel stay at connecting city at airline's expense",
        "eligible": False,
    },
    {
        "id": "tourism-voucher",
        "name": "Tourism Voucher",
        "category": "voucher",
        "description": "Discount voucher for local attractions at destination",
        "eligible": True,
    },
    {
        "id": "transfer-voucher",
        "name": "Transfer Voucher",
        "category": "voucher",
        "description": "Complimentary ground transport voucher between terminals",
        "eligible": False,
    },
]


async def get_all_perks() -> list[PerkResponse]:
    return [PerkResponse(**p) for p in PERKS_DB]


async def suggest_perks(plan: TravelPlanRequest) -> list[PerkResponse]:
    perks: list[PerkResponse] = []
    for p in PERKS_DB:
        perk = PerkResponse(**p)
        if perk.category == "miles" or perk.category == "stopover" and plan.is_transfer:
            perk.eligible = True
            perks.append(perk)
        elif perk.category == "voucher":
            perk.eligible = plan.booking_class in ("business", "first")
            perks.append(perk)
    return perks
