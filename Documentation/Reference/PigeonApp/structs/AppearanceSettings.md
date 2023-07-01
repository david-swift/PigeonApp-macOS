**STRUCT**

# `AppearanceSettings`

```swift
struct AppearanceSettings: View
```

The appearance settings.

## Properties
### `colorScheme`

```swift
var colorScheme
```

The color scheme.

### `model`

```swift
@StateObject private var model = PigeonModel.shared
```

The shared ``PigeonModel``.

### `body`

```swift
var body: some View
```

The view's body.

### `themeSection`

```swift
private var themeSection: some View
```

The section for selecting the color scheme.

### `iconsSection`

```swift
private var iconsSection: some View
```

The section for selecting the icon style.

### `toolbarSection`

```swift
private var toolbarSection: some View
```

The section for customizing the toolbar.

### `toolbarStyle`

```swift
private var toolbarStyle: some View
```

The controls for changing the toolbar style.

### `displayMode`

```swift
private var displayMode: some View
```

The controls for changing the toolbar's display mode.

### `customizeToolbar`

```swift
private var customizeToolbar: some View
```

The controls for customizing the toolbar.

### `showHideToolbar`

```swift
private var showHideToolbar: some View
```

The controls for toggling the toolbar's appearance in every open window.

### `showToolbar`

```swift
private var showToolbar: some View
```

The button for showing the toolbar.

### `hideToolbar`

```swift
private var hideToolbar: some View
```

The button for hiding the toolbar.

### `isUnified`

```swift
private var isUnified: Bool
```

Whether the toolbar style is unified.

### `displayModeSelection`

```swift
private var displayModeSelection: ToolbarDisplayMode
```

The toolbar display mode.
