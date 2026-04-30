# Project Vision — Be4Travel

## Project Goals

A perk suggestion app for travel plans. Travelers input their flight details and the app suggests available perks: Miles accrual, Stopover for Transfer Passengers at Company's expense (STPC), Tourism Voucher, Transfer Voucher, and more.

## Key Features

1. Perk suggestion engine — given a travel plan, suggest eligible perks
2. Perk catalog — browse all available travel perks
3. Travel plan input — airline, origin, destination, transfer status, booking class
4. Future: user accounts, saved travel plans, push notifications

## Technical Constraints

- Flutter frontend (mobile-first, web supported)
- Python FastAPI backend
- Clean architecture in both frontend and backend
- API-first design: OpenAPI spec as contract
- Feature-based code organization

## Non-Goals

- Payment processing (out of scope)
- Airline booking integration (phase 2+)
- Real-time flight data (phase 2+)
