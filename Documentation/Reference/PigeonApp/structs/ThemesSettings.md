**STRUCT**

# `ThemesSettings`

```swift
struct ThemesSettings: View
```

A settings subtab for editing a theme.

## Properties
### `model`

```swift
@StateObject private var model = PigeonModel.shared
```

The shared instance of the ``PigeonModel``.

### `theme`

```swift
@Binding var theme: SchemeTheme
```

The selected theme.

### `body`

```swift
var body: some View
```

The view's body.

## Methods
### `customizeThemeView(theme:)`

```swift
func customizeThemeView(theme: Binding<Theme>) -> some View
```

The view for customizing a theme.
- Parameter theme: The theme to customize.
- Returns: A view containing the controls for customizing a theme.

#### Parameters

| Name | Description |
| ---- | ----------- |
| theme | The theme to customize. |