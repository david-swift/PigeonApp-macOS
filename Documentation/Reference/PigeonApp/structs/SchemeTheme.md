**STRUCT**

# `SchemeTheme`

```swift
public struct SchemeTheme: Identifiable, Codable, ColibriComponents.Bindable
```

A theme containing a light and a dark theme.

## Properties
### `id`

```swift
public var id: UUID
```

The identifier.

### `name`

```swift
public var name: String
```

The theme's name.

### `light`

```swift
public var light: Theme
```

The light theme.

### `dark`

```swift
public var dark: Theme
```

The dark theme.

## Methods
### `init(_:light:dark:)`

```swift
init(_ name: String, light: Theme, dark: Theme)
```

The ``SchemeTheme``'s initializer.
- Parameters:
  - name: The theme's name.
  - light: The light theme.
  - dark: The dark theme.

#### Parameters

| Name | Description |
| ---- | ----------- |
| name | The theme’s name. |
| light | The light theme. |
| dark | The dark theme. |

### `activeTheme(scheme:)`

```swift
public func activeTheme(scheme: ColorScheme) -> Theme
```

Get the active theme based on the color scheme.
- Parameter scheme: The color scheme (light or dark mode).
- Returns: The theme.

#### Parameters

| Name | Description |
| ---- | ----------- |
| scheme | The color scheme (light or dark mode). |