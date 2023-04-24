**STRUCT**

# `PigeonApp`

```swift
public struct PigeonApp<Content>: Pigeon where Content: View
```

A ``PigeonApp`` is a SwiftUI app with a certain organization in the settings window and menu bar.

## Properties
### `pigeonModel`

```swift
@StateObject private var pigeonModel = PigeonModel.shared
```

The Pigeon Model handles the data.

### `content`

```swift
public var content: (Bool, Theme, [TemplateFolder]) -> Content
```

The content of the main window in a ``PigeonApp``.

### `title`

```swift
var title: String?
```

The title of the window group.

### `body`

```swift
@SceneBuilder public var body: some Scene
```

The main scene of a PigeonApp.

### `mainWindow`

```swift
var mainWindow: some Scene
```

The window group of the ``PigeonApp``.

### `mainView`

```swift
@ViewBuilder var mainView: some View
```

The main window of the ``PigeonApp``.

## Methods
### `init(appName:appIcon:_:content:)`

```swift
public init(
    appName: String,
    appIcon: Image,
    _ title: String? = nil,
    @ViewBuilder content: @escaping (Bool, Theme, [TemplateFolder]) -> Content
)
```

The public initializer with all the three views specified.
- Parameters:
  - appName: The app's name.
  - appIcon: The app's icon.
  - title: The title of the window group.
  - content: The content of the main window.

#### Parameters

| Name | Description |
| ---- | ----------- |
| appName | The app’s name. |
| appIcon | The app’s icon. |
| title | The title of the window group. |
| content | The content of the main window. |