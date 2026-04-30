class Be4TravelError(Exception):
    """Base exception for Be4Travel API."""


class PerkNotFoundError(Be4TravelError):
    """Raised when a requested perk is not found."""
