# DataFlow – SwiftUI Data Communication Examples

DataFlow is a SwiftUI demo project that showcases different techniques for passing data between views using modern SwiftUI patterns.

## App Structure

The application uses a `TabView` with four tabs:

1. **EnvironmentObject**
2. **Environment**
3. **PreferenceKey**
4. **Dynamic Width**

---

# 1️⃣ EnvironmentObject Example

### Concept:
Sharing observable state across multiple child views using `ObservableObject` and `@EnvironmentObject`.

```swift
class Analytics: ObservableObject {
    @Published var totalClick: Int = 0
    func send(tag: String) { totalClick += 1 }
}

@StateObject var analytics = Analytics()
@EnvironmentObject var analytics: Analytics
analytics.send(tag: "Feature_01")
```

### How It Works:
- [x] Tracks total clicks across multiple internal tabs.
- [x] Each child view calls `analytics.send(tag:)` inside `onAppear`.
- [x] The shared `Analytics` instance updates `totalClick`.
- [x] UI automatically updates because of `@Published`.



### Screenshot:
<p align="start">
  <img src="Screenshots/obj1.png" width="250">
  &nbsp;&nbsp;&nbsp;
  <img src="Screenshots/obj2.png" width="250">
  &nbsp;&nbsp;&nbsp;
  <img src="Screenshots/obj3.png" width="250">
</p>


---

# 2️⃣ Environment Example

### Concept:
Passing dependencies down the view hierarchy using a custom `EnvironmentKey`.

```swift
struct UserKey: EnvironmentKey {
    static let defaultValue: User = User()
}

extension EnvironmentValues {
    var user: User {
        get { self[UserKey.self] }
        set { self[UserKey.self] = newValue }
    }
}

@Environment(\.user) var user
user.log()
```

### How It Works:
- [x] Injects a `User` instance into the environment.
- [x] Child views access it using `@Environment(\.user)`.
- [x] Logs the current username on appear.

### Screenshot:
<p align="start">
  <img src="Screenshots/env1.png" width="250">
  &nbsp;&nbsp;&nbsp;
  <img src="Screenshots/env2.png" width="250">
</p>

---

# 3️⃣ PreferenceKey Example

### Concept:
Sending data **from child to parent** (reverse data flow).

```swift
struct TextFieldPreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) { value = nextValue() }
}

TextField("...", text: $text)
    .preference(key: TextFieldPreferenceKey.self, value: text)

.onPreferenceChange(TextFieldPreferenceKey.self) { text in
    childText = text
}
```

### How It Works:
- [x] Child view contains a `TextField`.
- [x] Text input is published using a `PreferenceKey`.
- [x] Parent listens using `.onPreferenceChange`.
- [x] Parent UI updates with the child’s text.

### Screenshot:
<p align="start">
  <img src="Screenshots/key1.png" width="250">
  &nbsp;&nbsp;&nbsp;
  <img src="Screenshots/key2.png" width="250">
</p>

---

# 4️⃣ Dynamic Width Example

### Concept:
Synchronizing view sizes dynamically using `PreferenceKey` and `GeometryReader`.

```swift
struct MaxWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    { value = max(value, nextValue()) }
}

.syncWidth(using: proxy)

.onPreferenceChange(MaxWidthPreferenceKey.self) { maxWidth in
    proxy.maxWidth = maxWidth
}
```

### How It Works:
- [x] Multiple buttons with different text lengths.
- [x] All buttons automatically match the width of the widest button.
- [x] Width updates dynamically at runtime.

### Screenshot:
<p align="start">
  <img src="Screenshots/dyn1.png" width="250">
</p>

---

# 🎯 Purpose of the Project

This project is designed as a practical reference for understanding:

- How data flows in SwiftUI
- Downward vs upward communication
- State management vs dependency injection
- Advanced layout coordination techniques
