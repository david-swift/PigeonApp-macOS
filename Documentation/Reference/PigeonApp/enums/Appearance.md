**ENUM**

# `Appearance`

```swift
public enum Appearance: Identifiable, CaseIterable, Codable
```

The apperance options available for the user interface.

## Cases
### `light`

```swift
case light
```

The light appearance.

### `dark`

```swift
case dark
```

The dark appearance.

### `auto`

```swift
case auto
```

The auto appearance.

## Properties
### `id`

```swift
public var id: String
```

The appearance's identifier.

### `localized`

```swift
public var localized: LocalizedStringResource
```

A localized description of the appereance.

### `image`

```swift
public var image: some View
```

The image of the appearance.

### `asNSAppearance`

```swift
public var asNSAppearance: NSAppearance?
```

Convert ``Appearance`` to AppKit's NSAppearance as an optional.
