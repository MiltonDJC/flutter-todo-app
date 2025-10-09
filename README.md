# Flutter ToDo App

A simple **ToDo application** built with **Flutter**.  
This app demonstrates fundamental concepts such as **state management**, **custom widgets**, **lists**, and **basic testing** in Flutter.

---

## 📦 Features

- Add tasks with a title.
- Mark tasks as completed or incomplete.
- Display a list of tasks.
- Prevent empty or whitespace-only tasks from being added.
- Persistent state management in memory (no database yet).
- Unit tests for task management logic.

---

## 🛠 Tech Stack

- **Flutter** (>=3.0)
- **Dart**
- **Fluttertoast** (for user feedback)
- **flutter_test** (for unit testing)

---

## 📁 Project Structure
```
lib/
├─ main.dart  # App entry point
├─ screens/
│  └─ home_screen.dart  # Main ToDo screen
├─ widgets/
│  └─ task_tile.dart  # Task item widget
├─ models/
│  └─ task.dart  # Task model
├─ managers/
│  └─ task_manager.dart  # Task management logic
└─ utils/
   └─ dummy_data.dart  # Initial dummy tasks
```

---

## 🚀 Installation & Run

Flutter 3+ is required.

1. **Clone the repository:**

```bash
git clone https://github.com/MiltonDJC/flutter-todo-app.git

cd flutter-todo-app
```

2. **Get dependencies:**
```bash
flutter pub get
```

3. **Run the app:**
```bash
flutter run
```

Or build an APK for Android:
```bash
flutter build apk --debug
```

<br>

> **Note:** Tasks are stored in memory only; they will reset when the app restarts.

---

## ✅ Testing

Unit tests are implemented for the **TaskManager** class, covering:

- Adding tasks
- Toggling task completion
- Preventing empty or whitespace-only tasks from being added

Run tests with:

```bash
flutter test
```

## 📦 Release

Download the latest release APK here: [v1.0.0 Release](https://github.com/MiltonDJC/flutter-todo-app/releases/tag/v1.0.0)