# 📝 ToDo App - **Cubit Playground**

## 📌 Overview

The **ToDo App** is an **educational Flutter project** focused exclusively on **Cubit-based state management**. The goal of this app is to explore different **state propagation techniques** and demonstrate their impact on architecture and code clarity.

This project compares two approaches:

✔ **Listener-based state propagation (ListenerStateShape)**
✔ **Stream subscription-based state propagation (StreamSubscriptionStateShape)**

By analyzing these techniques, the app illustrates how shifting UI-related logic to the state layer ensures **cleaner and more maintainable** code.

---

## 🎯 Goals

- ✅ **Showcase Cubit-based state propagation techniques**.
- ✅ **Compare UI-driven state updates (Listener) vs. State-driven updates (Stream Subscription)**.
- ✅ **Apply the Single Responsibility Principle (SRP)** to maintain strict separation between UI and business logic.
- ✅ **Demonstrate a scalable, maintainable architecture** with explicit state transitions.

---

## 🏗️ Architecture & Structure

The app follows a **Domain-UI structure**, eliminating unnecessary complexity while keeping logic and UI separate.

### 🌐 **Domain Layer**

- `domain/state/` – **State management cubits** (e.g., `AppSettingsCubit`, `TodoListCubit`).
- `domain/models/` – **Core data models** (`Todo`, `Filter`).
- `domain/config/` – **Global app settings and constants** (`AppConfig`, `AppStrings`).
- `domain/utils/` – **Helper functions, debounce logic, and dialogs**.

### 🎨 **UI Layer**

- `ui/pages/` – **Screens & navigation**.
- `ui/widgets/` – **Reusable UI components**.
- `ui/theme/` – **App-wide styling & theming**.

Each feature is represented by its corresponding **Cubit** inside the `domain/state/` directory, ensuring a modular and clean architecture.

---

## 🚀 Features & Highlights

✔ **Dynamic State Shape Switching** – Toggle between **ListenerStateShape** and **StreamSubscriptionStateShape** in real-time.
✔ **Optimized UI performance** – Uses `context.select` to minimize rebuilds.
✔ **Strict separation of concerns** – UI remains **pure**, and state logic is encapsulated in Cubits.
✔ **Hydrated State Persistence** – Ensures state is preserved across app restarts.
✔ **Dependency Injection with GetIt** – For easy service and state management.
✔ **SRP Compliance** – Business logic is fully decoupled from UI.

---

## 📌 Tech Stack

- **Flutter** (Material Design 3)
- **Dart**
- **flutter_bloc** (Cubit)
- **hydrated_bloc** (State persistence)
- **rxdart** (Reactive programming)
- **get_it** (Dependency injection)
- **equatable** (Value equality for states)
- **google_fonts** (Custom fonts)
- **path_provider** (File system storage)
- **uuid** (Unique ID generation)

---

## 🛠️ Getting Started

### 1⃣ Clone the Repository

```bash
git clone https://github.com/RamanGodun/TODO-APP-CUBIT.git
```

### 2⃣ Install Dependencies

```bash
flutter pub get
```

### 3⃣ Run the App

```bash
flutter run
```

---

## 📚 Learning Outcomes

- ✅ Understand **Cubit-based state management** and **UI propagation techniques**.
- ✅ Learn how to **minimize unnecessary UI rebuilds**.
- ✅ Explore **state-driven updates vs. UI-driven updates**.
- ✅ Follow **best practices for clean architecture in Flutter**.

---

## 🔍 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

## 🚀 Future Enhancements

📌 **Persistent Data Storage** – Consider integrating **Hive/Isar** for local database support.
📌 **Advanced Loading Indicators** – Implement better state-based loaders.
📌 **Error Handling Improvements** – Introduce robust error dialogs.
📌 **Pagination Support** – Optimize large ToDo lists with infinite scrolling.
📌 **Navigation Refactor** – Migrate to **onGenerateRoutes** for scalability.

---
