from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    app_name: str = "Be4Travel API"
    app_version: str = "0.1.0"
    debug: bool = True
    host: str = "0.0.0.0"
    port: int = 8000

    model_config = {"env_prefix": "BE4TRAVEL_"}


settings = Settings()
