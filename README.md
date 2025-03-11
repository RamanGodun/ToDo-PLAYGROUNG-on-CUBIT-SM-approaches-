# 📝 ToDo App - **Cubit Playground**  

## 📌 Overview  

The **ToDo App** is an **educational Flutter project** that explores two **state management approaches** using **Cubit** exclusively. The key focus of this app is to demonstrate how different **state propagation techniques** affect UI separation and architecture.

The project showcases the difference between:  

️✔ **Listener-based state propagation (ListenerStateShape)**  
️✔ **Stream subscription-based state propagation (StreamSubscriptionStateShape)**  

By comparing these two approaches, the app highlights why moving UI-related logic out of the presentation layer and into the state layer is a **cleaner and more maintainable** solution.

---

## 🎯 Goals  

- ✅ **Illustrate state propagation techniques** using Cubit.  
- ✅ **Compare UI-driven state updates** (Listener) vs. **State-driven updates** (Stream Subscription).  
- ✅ **Apply the Single Responsibility Principle (SRP)** to maintain clean separation between UI and business logic.  
- ✅ **Showcase a scalable architecture** that makes state transitions explicit.  

---

## 🏧 Architecture & Structure  

### 🌐 **Core**  

- `core/config/` – **Global settings** (`AppConfig`, constants, themes, styles).  
- `core/models/` – **Data models** for ToDos & filtering.  
- `core/utils/` – **Helper functions, debounce, dialogs**.  
- `core/factories/` – **Factory pattern** for state management switching.  

### 🧬 **Features**  

- **Header:** Displays active ToDo count.  
- **Search & Filtering:** Enables real-time filtering.  
- **ToDo List:** CRUD operations.  
- **Filtered List:** Dynamically updates based on active filters.  

### 🎨 **Presentation Layer**  

- **`presentation/pages/`** – Screens & page navigation.  
- **`presentation/widgets/`** – Custom reusable UI components.  

---

## 🚀 Features & Highlights  

️✔ **Dynamic State Shape Switching** – Toggle between **Listener-based state** and **Stream Subscription state** in `AppConfig`.  
️✔ **Minimal UI rebuilds** – Uses `context.select` to optimize performance.  
️✔ **Strict separation of concerns** – UI stays **pure**, while business logic is handled **entirely in Cubits**.  
️✔ **Factory Pattern** – Enables seamless switching between `ListenerStateShape` & `StreamSubscriptionStateShape`.  
️✔ **SRP in Action** – Avoids business logic leakage into UI components.  

---

## 📌 Tech Stack  

- **Flutter** (Material Design 3)  
- **Dart**  
- **flutter_bloc** (Cubit)  
- **Factory Pattern** for state management  
- **Clean Architecture & SOLID Principles**  

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

- ✅ Understand **Cubit-based state management** with **UI propagation techniques**.  
- ✅ Learn how to **reduce unnecessary UI rebuilds**.  
- ✅ Explore **state management switching** dynamically.  
- ✅ Follow **best coding practices & clean architecture** in Flutter.  

---

## 🔍 License  

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.  

---

## 🚀 Future Enhancements  

📌 **Persistent Data Storage** – Add **Hive/Isar** for local database.  
📌 **Loading State Handling** – Implement **circular progress indicators**.  
📌 **Error Handling** – Introduce **custom error dialogs**.  
📌 **Pagination** – Traditional **or infinite scroll**.  
📌 **Navigation Refactor** – Migrate to **onGenerateRoutes** if extra pages are added.  

---

