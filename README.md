# Flutter Article App

A Flutter app that fetches and displays a list of articles from a public API.

## Features
- List of articles
- Search functionality
- Detail view
- Responsive UI

## Setup Instructions
1. Clone the repo:
   git clone "https://github.com/doundkar/flutter_articles.git"
   cd flutter_articles

2. Install dependencies:
   flutter pub get

3. Run the app:
   flutter run -d chrome  // for chrome

## Tech Stack
- Flutter SDK: 3.29.2
- State Management: GetX
- HTTP Client: HTTP
- Persistence: shared_preferences

## State Management Explanation
This project uses GetX for state management, routing, and dependency injection. GetX was chosen for its simplicity, minimal boilerplate, and efficient reactive programming support, making it easier to manage UI updates and application state.

## Data Flow
1. The app fetches articles from a public API.
2. The articles are stored in a controller using GetX's observable (Rx) variables.
3. UI widgets listen to these observables and update automatically on data changes.
4. Navigation between article list and single article detail screens is handled through GetX routing.
5. A search functionality is implemented to filter articles based on user input in real-time.

