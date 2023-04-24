**STRUCT**

# `Version.Feature`

```swift
public struct Feature
```

A description of a new feature in a version.

## Properties
### `icon`

```swift
var icon: Image
```

The feature's icon.

### `color`

```swift
var color: Color
```

The icon's color.

### `title`

```swift
var title: LocalizedStringResource
```

The feature's title.

### `description`

```swift
var description: LocalizedStringResource
```

A description of the feature.

## Methods
### `init(_:description:icon:color:)`

```swift
public init(
    _ title: LocalizedStringResource,
    description: LocalizedStringResource,
    icon: Image,
    color: Color = .accentColor
)
```

The feature's initializer.
- Parameters:
  - title: The feature's title.
  - description: A description of the feature.
  - icon: The feature's icon.
  - color: The icon's color.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The feature’s title. |
| description | A description of the feature. |
| icon | The feature’s icon. |
| color | The icon’s color. |

### `init(_:description:icon:color:)`

```swift
public init(
    _ title: LocalizedStringResource,
    description: LocalizedStringResource,
    icon: SFSymbol,
    color: Color = .accentColor
)
```

The feature's initializer with a system symbol.
- Parameters:
  - title: The feature's title.
  - description: A description of the feature.
  - icon: The feature's icon.
  - color: The icon's color.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The feature’s title. |
| description | A description of the feature. |
| icon | The feature’s icon. |
| color | The icon’s color. |