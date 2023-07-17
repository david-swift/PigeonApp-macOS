**STRUCT**

# `CodeInformation`

```swift
public struct CodeInformation
```

Information about the app defined by the developer.

## Properties
### `tabs`

```swift
var tabs: [SettingsTab] = []
```

The custom settings tabs.

### `appData`

```swift
var appData: AppData = .init(
    icon: .init(systemSymbol: .app),
    name: .init(localized: .init("App", comment: "CodeInformation (The default app title)")),
    links: [],
    contributors: [],
    acknowledgements: [],
    versions: []
)
```

Information about the app.

### `templatesActive`

```swift
var templatesActive = false
```

Whether the templates tab is active.

### `hidden`

```swift
var hidden: [StandardSettingsTab] = []
```

The hidden standard settings tabs.

### `themesPreview`

```swift
var themesPreview: ((SchemeTheme) -> AnyView)?
```

The preview for a theme.

### `aboutView`

```swift
var aboutView: any View = EmptyView()
```

Extensions for the about subtab.

### `appearanceView`

```swift
var appearanceView: any View = EmptyView()
```

Extensions for the appearance subtab.

### `shortcutsView`

```swift
var shortcutsView: any View = EmptyView()
```

Extensions for the shortcuts subtab.

### `advancedSettings`

```swift
var advancedSettings: [SettingsSubtab] = []
```

Extensions for the advanced settings subtab.

### `keyboardShortcut`

```swift
var keyboardShortcut: KeyboardShortcut?
```

The keyboard shortcut of the main window.
