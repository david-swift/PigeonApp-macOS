**ENUM**

# `PigeonAppAction`

```swift
public enum PigeonAppAction
```

Useful actions for interacting with AppKit.

## Methods
### `setAppearance(_:)`

```swift
public static func setAppearance(_ appearance: Appearance)
```

Set the app's theme to light, dark or automatic.
- Parameter appearance: The new theme.

#### Parameters

| Name | Description |
| ---- | ----------- |
| appearance | The new theme. |

### `setToolbarStyle(displayMode:style:exceptionIDs:)`

```swift
public static func setToolbarStyle(
    displayMode: ToolbarDisplayMode,
    style: ToolbarStyle,
    exceptionIDs: [String?] = [.settingsWindowIdentifier]
)
```

Set the toolbar style of all the window except the defined exceptions.
- Parameters:
    - displayMode: The display mode of the toolbars.
    - style: The toolbar style.
    - exceptionIDs: The exception window identifiers.. By default, the settings window is ignored.

#### Parameters

| Name | Description |
| ---- | ----------- |
| displayMode | The display mode of the toolbars. |
| style | The toolbar style. |
| exceptionIDs | The exception window identifiers.. By default, the settings window is ignored. |

### `customizeToolbar(exceptionIDs:)`

```swift
public static func customizeToolbar(exceptionIDs: [String?] = []) throws
```

Open the customization sheet for the toolbar.
- Parameter exceptionIDs: The exception window identifiers..

#### Parameters

| Name | Description |
| ---- | ----------- |
| exceptionIDs | The exception window identifiers.. |

### `toggleToolbarHidden(_:exceptionIDs:)`

```swift
public static func toggleToolbarHidden(_ bool: Bool, exceptionIDs: [String?] = [.settingsWindowIdentifier])
```

Toggle the visibility of the toolbar in the windows.
- Parameters:
  - bool: If true, the toolbars are hidden, else, they are visible.
  - exceptionIDs: The exception window identifiers. By default, the settings window is ignored.

#### Parameters

| Name | Description |
| ---- | ----------- |
| bool | If true, the toolbars are hidden, else, they are visible. |
| exceptionIDs | The exception window identifiers. By default, the settings window is ignored. |

### `getKeyWindowID()`

```swift
public static func getKeyWindowID() -> String?
```

Get the identifier of the key window.
- Returns: The key window's identifier as an optional string.

### `add(_:to:)`

```swift
public static func add(_ template: Template, to id: UUID)
```

Add a template to a folder.
- Parameters:
  - template: The template.
  - id: The folder's id.

#### Parameters

| Name | Description |
| ---- | ----------- |
| template | The template. |
| id | The folder’s id. |

### `add(_:)`

```swift
public static func add(_ folder: TemplateFolder)
```

Add a template folder.
- Parameter folder: The template folder

#### Parameters

| Name | Description |
| ---- | ----------- |
| folder | The template folder |