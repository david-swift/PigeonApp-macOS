**STRUCT**

# `PigeonDocumentApp`

```swift
public struct PigeonDocumentApp<Document, Content>: Pigeon
where Document: FileDocument, Document: ActionRepresentable, Content: View
```

A PigeonDocumentApp is a SwiftUI app with a certain organization in the settings window and menu bar.
It is basically a PigeonApp but using SwiftUI.DocumentGroup instead of SwiftUI.WindowGroup.

## Properties
### `pigeonModel`

```swift
@StateObject private var pigeonModel = PigeonModel.shared
```

The Pigeon Model handles the data.

### `newDocument`

```swift
var newDocument: Document
```

The document that is created when the user taps the "New" button.

### `content`

```swift
public var content: (Binding<Document>, Bool, Theme, [TemplateFolder]) -> Content
```

The content of the main window in a ``PigeonDocumentApp``.

### `body`

```swift
public var body: some Scene
```

The main scene of a PigeonDocumentApp.

## Methods
### `init(appName:appIcon:document:content:)`

```swift
public init(
    appName: String,
    appIcon: Image,
    document: Document,
    @ViewBuilder content: @escaping (Binding<Document>, Bool, Theme, [TemplateFolder]) -> Content
)
```

The public initializer with all the three views specified.
- Parameters:
  - appName: The app's name.
  - appIcon: The app's icon.
  - document: The document that is created when the user taps the "New" button.
  - content: The content of the main window in a ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| appName | The app’s name. |
| appIcon | The app’s icon. |
| document | The document that is created when the user taps the “New” button. |
| content | The content of the main window in a `PigeonDocumentApp`. |

### `view(_:document:)`

```swift
private func view<T>(
    _ view: @escaping (Binding<Document>, Bool, Theme, [TemplateFolder]) -> T,
    document: Binding<Document>
) -> (Bool, Theme, [TemplateFolder]) -> T where T: View
```

Fill in the document in al view function.
- Parameters:
  - view: The view function.
  - document: The document to fill in.
- Returns: The view function without the document parameter.

#### Parameters

| Name | Description |
| ---- | ----------- |
| view | The view function. |
| document | The document to fill in. |