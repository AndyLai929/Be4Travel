from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.config import settings
from app.health.router import router as health_router
from app.perks.router import router as perks_router

app = FastAPI(
    title=settings.app_name,
    version=settings.app_version,
    description="Perk suggestion API for travel plans",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health_router)
app.include_router(perks_router, prefix="/api/v1")
