**STRUCT**

# `PigeonCodeModel`

```swift
public struct PigeonCodeModel
```

Options for Pigeon defined by the coder.

## Properties
### `information`

```swift
public var information: CodeInformation
```

Information about the app.

### `settings`

```swift
var settings: [SettingsTab]
```

Get the settings tabs.

## Methods
### `init(information:)`

```swift
init(information: CodeInformation)
```

The initializer for ``PigeonCodeModel``.
- Parameters:
  - information: Information defined by the coder.

#### Parameters

| Name | Description |
| ---- | ----------- |
| information | Information defined by the coder. |

### `setSettings(information:)`

```swift
mutating func setSettings(information: CodeInformation)
```

Set the code information.
- Parameter information: The new code information.

#### Parameters

| Name | Description |
| ---- | ----------- |
| information | The new code information. |

### `getSettings()`

```swift
func getSettings() -> [SettingsTab]
```

Get the settings tabs.
- Returns: The settings tabs.
