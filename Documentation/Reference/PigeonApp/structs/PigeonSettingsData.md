**STRUCT**

# `PigeonSettingsData`

```swift
public struct PigeonSettingsData: Codable
```

Data used for customizing the user experience.

## Properties
### `standardSettingsTab`

```swift
public var standardSettingsTab: String = StandardSettingsTab.general.id
```

The standard settings tab.

### `standardSettingsSubtab`

```swift
public var standardSettingsSubtab: String = .aboutGeneralSettingsTab
```

The standard settings subtab.

### `templates`

```swift
public var templates: [TemplateFolder]
```

The available templates.

### `appearance`

```swift
public var appearance: Appearance = .auto
```

The appearance of the UI.

### `toolbarStyle`

```swift
public var toolbarStyle: ToolbarStyle = .unified
```

The toolbar style in the windows except the settings window.

### `toolbarDisplayMode`

```swift
public var toolbarDisplayMode: ToolbarDisplayMode = .iconOnly
```

The display mode of the elements in the toolbar.

### `iconFill`

```swift
public var iconFill = true
```

Use filled icons.

### `themes`

```swift
public var themes: [SchemeTheme]
```

The themes.

### `selectedTheme`

```swift
public var selectedTheme: UUID
```

The selected theme.

### `versionOverview`

```swift
public var versionOverview: String?
```

Whether the user has seen the welcome screen of the current version.

## Methods
### `init(templates:)`

```swift
init(templates: [TemplateFolder])
```

Initialize the pigeon settings data.
- Parameter templates: The templates.

#### Parameters

| Name | Description |
| ---- | ----------- |
| templates | The templates. |