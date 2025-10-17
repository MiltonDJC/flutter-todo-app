# Flutter ToDo App

A simple **ToDo application** built with **Flutter**.  
This app demonstrates fundamental concepts such as **state management**, **custom widgets**, **lists**, **theming**, **navigation**, and **testing** in Flutter.

---

## 📦 Features in This Release

- Add tasks with a title (first letter automatically capitalized).
- Mark tasks as completed or incomplete.
- Display tasks in a scrollable list.
- Navigate to a Task Detail Screen by tapping on a task.
- Show task status visually (completed/incomplete) in the detail screen.
- Prevent empty or whitespace-only tasks from being added.
- Centralized state management in memory using TaskManager (no database yet).
- Toggle between light and dark mode with smooth transition.
- Unit and widget tests covering task logic, UI interaction, and navigation.

---

## 🛠 Tech Stack

- **Flutter** (>=3.0)
- **Dart**
- **Fluttertoast** (for user feedback)
- **flutter_test** (for unit testing and widget testing)

---

## 📁 Project Structure
```
lib/
├─ main.dart               # App entry point and theme management
├─ theme/
│  └─ theme.dart           # Light/Dark theme configurations
├─ screens/
│  ├─ home_screen.dart     # Main ToDo screen
│  └─ task_detail_screen.dart  # Detail screen for a task
├─ widgets/
│  └─ task_tile.dart       # Task item widget with checkbox, delete, and tap actions
├─ models/
│  └─ task.dart            # Task model
├─ managers/
│  └─ task_manager.dart    # Task management logic
└─ utils/
   ├─ dummy_data.dart      # Initial dummy tasks
   └─ task_in_list.dart    # Method to verify if a task exists
test/
├─ screens/
│  └─ task_detail_screen_test.dart
├─ unit/
│  └─ task_manager_test.dart
└─ widgets/
   └─ task_tile_test.dart
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

Unit and widget tests cover:

- Adding tasks
- Toggling task completion
- Preventing empty or whitespace-only tasks
- TaskTile interactions (add, complete, delete)
- Navigation to **TaskDetailScreen**
- Displaying correct task status in the detail screen

Run tests with:

```bash
flutter test
```

---

## 🧪 Test Coverage

You can generate a **test coverage report** to see which parts of the code are covered by tests.

1. Run tests with coverage:

```bash
flutter test --coverage
```

2. This generates a file ```coverage/lcov.info```.

3. To view a visual HTML report:
```bash
# Install lcov if you don't have it (Linux/macOS)

sudo apt-get install lcov  # or brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html
```

4. Open the report in your browser:
```bash
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
```

----
## 📦 Release
This release introduces **dark/light mode**, **task detail screen**, and **capitalized task titles**.

Download the latest release APK here: [v0.2.0 Release](https://github.com/MiltonDJC/flutter-todo-app/releases/tag/v0.2.0)

## 📝 Notes / Changelog

- v0.1.0
   - Added Task Detail Screen with visual status (completed/incomplete).
   - Added tap navigation from task list to detail screen.
   - Added dark/light theme toggle in the app bar.
   - Capitalizes the first letter of task titles automatically.
   - TaskTile now responds to tap events.
   - Updated UI with consistent typography and customized buttons.
   - Improved test coverage for navigation and task details.