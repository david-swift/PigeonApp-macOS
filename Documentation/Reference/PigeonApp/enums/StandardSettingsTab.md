**ENUM**

# `StandardSettingsTab`

```swift
public enum StandardSettingsTab: Identifiable
```

The default settings tabs defined in PigeonApp.

## Cases
### `general`

```swift
case general
```

The general settings tab.

### `behaviors`

```swift
case behaviors
```

The behaviors settings tab.

### `templates`

```swift
case templates
```

The templates settings tab.

### `themes`

```swift
case themes
```

The themes settings tab.

### `updates`

```swift
case updates
```

The updates settings tab.

### `advanced`

```swift
case advanced
```

The advanced settings tab.

## Properties
### `id`

```swift
public var id: String
```

The identifier.

### `localized`

```swift
var localized: LocalizedStringResource
```

The localized title of the settings tab.

### `symbol`

```swift
var symbol: SFSymbol
```

The symbol of the settings tab.

### `settingsTab`

```swift
var settingsTab: SettingsTab
```

The settings tab with the actions.

### `settingsTabContent`

```swift
var settingsTabContent: SettingsTab
```

The settings tab without the actions.

### `settingsSubtabs`

```swift
@ArrayBuilder<SettingsSubtab> var settingsSubtabs: [SettingsSubtab]
```

The subtabs of a settings tab.
