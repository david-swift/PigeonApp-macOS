**STRUCT**

# `MainWindow`

```swift
struct MainWindow<Content>: View where Content: View
```

The content of the main window in a ``PigeonApp`` and ``PigeonDocumentApp``.

## Properties
### `model`

```swift
@StateObject private var model = PigeonModel.shared
```

An instance of ``PigeonModel``.
It stores values that are the same in the whole app.

### `colorScheme`

```swift
private var colorScheme
```

The active color scheme.

### `openWindow`

```swift
private var openWindow
```

Open a window.

### `content`

```swift
var content: (Bool, Theme, [TemplateFolder]) -> Content
```

The content bar of this window, or nil if there is no content bar.

### `body`

```swift
var body: some View
```

The view's body.

### `iconFill`

```swift
private var iconFill: Bool
```

Whether the icons are filled.

### `theme`

```swift
private var theme: Theme
```

The active theme.

### `templates`

```swift
private var templates: [TemplateFolder]
```

The templates.
