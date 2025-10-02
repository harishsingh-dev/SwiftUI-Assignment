# PostsApp – SwiftUI Assignment

## 📱 Features
- Fetch posts from API
- View posts in a list
- Search posts by title
- Mark/unmark posts as favorites
- View a list of favorite posts in a separate tab
- Pull-to-refresh
- Error handling and loading states

## 🧱 Architecture
- MVVM (Model-View-ViewModel)
- Views are lightweight and use ObservableObject to manage state
- Networking is handled in a separate service class

## 🚀 Setup Instructions
1. Clone the repo
2. Open PostsApp.xcodeproj in Xcode
3. Build & Run on iOS Simulator or Device

## 🛠️ Requirements
- iOS 15+
- Xcode 13+

## 🔍 Assumptions
- Favorites are stored in-memory for simplicity
- No pagination as API returns a fixed list

## 🧩 Improvements
- Persist favorites using CoreData or UserDefaults
- Add user profile fetching
- UI polish and accessibility improvements
