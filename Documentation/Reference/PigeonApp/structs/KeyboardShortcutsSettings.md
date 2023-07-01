**STRUCT**

# `KeyboardShortcutsSettings`

```swift
struct KeyboardShortcutsSettings: View
```

The keyboard shortcut settings.

## Properties
### `model`

```swift
@StateObject private var model = PigeonModel.shared
```

The shared ``PigeonModel``.

### `colorScheme`

```swift
var colorScheme
```

The active color scheme.

### `body`

```swift
var body: some View
```

The view's body.

### `selectedTab`

```swift
private var selectedTab: SettingsTab?
```

The active standard settings tab.

### `standardSettingsTab`

```swift
private var standardSettingsTab: some View
```

The control for changing the standard settings tab.

### `standardSettingsSubtab`

```swift
@ViewBuilder private var standardSettingsSubtab: some View
```

The control for changing the standard settings subtab.
