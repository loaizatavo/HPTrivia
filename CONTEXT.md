# HPTrivia – Project Context

## Overview

**HPTrivia** is an iOS trivia game app based on the Harry Potter book series. It is built with **SwiftUI** and follows an **MVVM** architecture. The project is part of a Udemy iOS development course.

- **Bundle ID:** `com.loaizatavo.HPTrivia`
- **Developer:** Gustavo Loaiza Robles
- **Created:** March 10, 2026
- **Swift Version:** 6.0
- **Xcode Tools Version:** 26.1
- **Deployment Target:** iOS 26.1
- **Supported Devices:** iPhone and iPad (`TARGETED_DEVICE_FAMILY = "1,2"`)
- **Supported Orientations:**
  - iPhone: Portrait only
  - iPad: Portrait, Landscape Left, Landscape Right, Portrait Upside Down

---

## Architecture

The project follows **MVVM (Model-View-ViewModel)** with the following folder structure:

```
HPTrivia/
├── HPTriviaApp.swift          # App entry point (@main)
├── Models/                    # Data models (to be implemented)
├── ViewModels/                # ViewModels (to be implemented)
├── Views/
│   └── ContentView.swift      # Root view (currently placeholder)
├── Assets.xcassets/           # Image and color assets
└── Support/
    ├── trivia.json            # Trivia question data (35 questions, books 1–7)
    └── Audio/                 # Background music and sound effects
```

---

## Data

### `trivia.json`
Contains **35 trivia questions** covering all 7 Harry Potter books.

Each question object has the following schema:

```json
{
  "id": Int,
  "question": String,
  "answer": String,
  "wrong": [String, String, String],   // 3 wrong answers
  "book": Int,                          // 1–7 (which HP book)
  "hint": String
}
```

**Questions per book:**

| Book | # Questions |
|------|-------------|
| 1 – Philosopher's Stone | 5 (Q1–Q5) |
| 2 – Chamber of Secrets  | 5 (Q6–Q10) |
| 3 – Prisoner of Azkaban | 5 (Q11–Q15) |
| 4 – Goblet of Fire      | 5 (Q16–Q20) |
| 5 – Order of the Phoenix| 5 (Q21–Q25) |
| 6 – Half-Blood Prince   | 5 (Q26–Q30) |
| 7 – Deathly Hallows     | 5 (Q31–Q35) |

---

## Assets

### Images (`Assets.xcassets/`)

| Asset Name | Description |
|---|---|
| `AppIcon` | App icon |
| `appiconwithradius` | Rounded app icon variant |
| `hogwarts` | Hogwarts castle image |
| `hp1` – `hp7` | Cover images for each HP book |
| `parchment` | Parchment texture background |
| `AccentColor` | App accent color |

### Audio (`Support/Audio/`)

| File | Type |
|---|---|
| `deep-in-the-dell.mp3` | Background music |
| `hiding-place-in-the-forest.mp3` | Background music |
| `let-the-mystery-unfold.mp3` | Background music |
| `magic-in-the-air.mp3` | Background music |
| `magic-wand.mp3` | Sound effect |
| `negative-beeps.mp3` | Wrong answer SFX |
| `page-flip.mp3` | UI sound effect |
| `spellcraft.mp3` | Background music |

---

## Current State

- **`HPTriviaApp.swift`**: Entry point. Renders `ContentView` inside a `WindowGroup`.
- **`ContentView.swift`**: Placeholder — shows a globe icon and "Hello, world!".
- **Models/**, **ViewModels/**: Empty — need to be built out.

---

## Swift & Build Settings

| Setting | Value |
|---|---|
| Swift Version | 6.0 |
| Swift Default Actor Isolation | `MainActor` |
| Swift Approachable Concurrency | YES |
| Xcode Previews | Enabled |
| User Script Sandboxing | Enabled |
| Localization | String Catalogs |

---

## What Needs to Be Built

Based on the project structure and available assets, the following components are expected:

1. **`Models/Question.swift`** — `Codable` struct matching the `trivia.json` schema (`id`, `question`, `answer`, `wrong`, `book`, `hint`).
2. **`Models/Book.swift`** (optional) — Enum or model for the 7 HP books, used to filter questions and display book cover images.
3. **`ViewModels/GameViewModel.swift`** — Manages game state: loading questions, tracking score, current question, book selection, answer validation.
4. **`Views/GameView.swift`** — Main gameplay screen: displays question, answer choices, hints, and score.
5. **`Views/InstructionsView.swift`** — Rules/how-to-play screen.
6. **`Views/SettingsView.swift`** — Book selection (which books' questions to include).
7. **`Views/ContentView.swift`** — Root navigation: home screen with start/instructions/settings.
8. **Audio playback** — Use `AVFoundation` or `AVKit` for background music and SFX using the provided audio files.

---

## Key Design Notes

- Use **`parchment`** asset as a background texture for a Harry Potter feel.
- Use **`hp1`–`hp7`** images to represent book selection in settings.
- Each question has **4 total answer options** (1 correct + 3 wrong); shuffle before display.
- The `hint` field can be surfaced as an optional hint button during gameplay.
- Book filtering is a core feature — players should be able to select which books to draw questions from.
