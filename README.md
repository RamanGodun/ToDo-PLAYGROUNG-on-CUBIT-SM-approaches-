# 📝 ToDo App - **Cubit Playground with Two State Shapes**

## 📌 Overview

The **ToDo App** is an **educational Flutter project** that focuses on **Cubit-based state management**. The goal of this app is to explore different **state propagation techniques** and demonstrate their impact on architecture and code clarity.

This project compares two approaches:

🇸 **Listener-based state propagation (ListenerStateShape)**  
🇸 **Stream subscription-based state propagation (StreamSubscriptionStateShape)**

By analyzing these techniques, the app illustrates how shifting UI-related logic to the state layer ensures **cleaner and more maintainable** code.

---

## 🎯 Goals

- ✅ **Showcase Cubit-based state propagation techniques**.
- ✅ **Compare UI-driven state updates (Listener) vs. State-driven updates (Stream Subscription)**.
- ✅ **Apply the Single Responsibility Principle (SRP)** to maintain strict separation between UI and business logic.
- ✅ **Demonstrate a scalable, maintainable architecture** with explicit state transitions.

---

## 🏷️ Architecture & Structure

The app follows a **Domain-UI structure**, eliminating unnecessary complexity while keeping logic and UI separate.

### 🌐 **Domain Layer**

- `domain/app_constants/` – **Global app constants** (`AppConstants`, `AppStrings`).
- `domain/config/` – **Global app observer**
- `domain/models/` – **Core data models and enums** (`Todo`, `Filter`).
- `domain/state/` – **State management Cubits** (e.g., `AppSettingsCubit`, `TodoListCubit`).
- `domain/utils_and_services/` – **Helper functions, debounce logic, overlay and dialogs services**.

### 🎨 **UI Layer**

- `ui/pages/` – **Home screen**.
- `ui/widgets/` – **Reusable UI components**.
- `ui/_theming/` – **App-wide styling & theming**.

Each feature is represented by its corresponding **Cubit** inside the `domain/state/features/` directory, ensuring a modular and clean architecture.

---

## 🚀 Features & Highlights

🇸 **Dynamic State Shape Switching** – Toggle between **ListenerStateShape** and **StreamSubscriptionStateShape** in real-time.  
🇸 **Optimized UI performance** – Uses `context.select` to minimize rebuilds.  
🇸 **Strict separation of concerns** – UI remains **pure**, and state logic is encapsulated in Cubits.  
🇸 **Hydrated State Persistence** – Ensures state is preserved across app restarts.  
🇸 **React Hooks (`flutter_hooks`)** – Enhances functional programming approach for UI state management.  
🇸 **SRP Compliance** – Business logic is fully decoupled from UI.

---

## 📌 Tech Stack

- **Flutter** (Material Design 3)
- **Dart**
- **flutter_bloc** (Cubit for state management)
- **hydrated_bloc** (State persistence)
- **flutter_hooks** (State management enhancements)
- **rxdart** (Reactive programming)
- **equatable** (Value equality for states)
- **google_fonts** (Custom fonts)
- **path_provider** (File system storage)
- **uuid** (Unique ID generation)
- **flutter_slidable** (Interactive list items)

---

## 🛠️ Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/RamanGodun/TODO-APP-CUBIT.git
```

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Run the App

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

🇸 **Styling** – Change styling to follow common UI/UX patterns.
🇸 **Persistent Data Storage** – Consider integrating **Hive/Isar** for local database support.  
🇸 **Advanced Loading Indicators** – Implement better state-based loaders.  
🇸 **Error Handling Improvements** – Introduce robust error dialogs.  
🇸 **Pagination Support** – Optimize large ToDo lists with infinite scrolling.  
🇸 **Navigation Refactor** – Migrate to **onGenerateRoutes** for scalability.

---
