# Fishing Pond Monitor (Flutter)

Mobile app converted from the [Figma design](https://www.figma.com/design/Xs8wTPk3VQnHUdg9LKh2RZ/Fishing-Pond-Monitor) — aquaculture pond monitoring with login, home dashboard, water quality metrics, fish health, and profile.

## Screens implemented

| Figma frame | Flutter route |
|-------------|---------------|
| Login Fish Monitor v1 Cage Farming | `/login` |
| Home Fishing Ponds / Biofloc | `/home` (segment toggle) |
| Water Data Ponds | `/water-data` |
| Fish Health Monitor (species list + search) | `/fish-health` |
| Fish Detail (Overview / Water / Disease Risk / Recommendation) | `/fish-detail/:id` |
| Profile | `/profile` |
| Notifications, Reports, Camera, Activity Log | Placeholder routes from profile menu |

Design tokens match Figma: primary `#0145CC`, background `#F5F8FD`, Inter typography via `google_fonts`.

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.3+

## Setup

If platform folders (`android/`, `ios/`) are missing, generate them:

```bash
cd mobile_fish_farming
flutter create . --org com.rabitron.fishfarming --project-name fishing_pond_monitor
```

Then install dependencies and run:

```bash
flutter pub get
flutter run
```

## Project structure

```
lib/
  main.dart                 # App entry
  router/app_router.dart    # go_router routes
  theme/                    # Colors & ThemeData
  models/                   # Pond & water metric models
  data/mock_data.dart       # Sample data from Figma
  widgets/                  # Reusable UI (nav, cards, table, toggle)
  screens/                  # Login, Home, Water Data, Fish Health, Profile
```

## Next steps

- Wire authentication and API for live pond/sensor data
- Add remaining Figma screens (Fish Card Overview, Disease Risk, Recommendations, etc.)
- Replace mock data with repository layer
