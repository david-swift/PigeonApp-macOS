**ENUM**

# `ToolbarDisplayMode`

```swift
public enum ToolbarDisplayMode: Identifiable, CaseIterable, Bindable, Codable
```

The display mode of the elements in the toolbar.

## Cases
### `iconOnly`

```swift
case iconOnly
```

Show only icons.

### `iconAndText`

```swift
case iconAndText
```

Show icons and labels.

### `textOnly`

```swift
case textOnly
```

Show only labels.

## Properties
### `id`

```swift
public var id: String
```

The identifier.

### `localized`

```swift
public var localized: LocalizedStringResource
```

A localized description of the display mode.

### `asNSDisplayMode`

```swift
public var asNSDisplayMode: NSToolbar.DisplayMode
```

Convert ``ToolbarDisplayMode`` to AppKit's NSToolbar.DisplayMode.
