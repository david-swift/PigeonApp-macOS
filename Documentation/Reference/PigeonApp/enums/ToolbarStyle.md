**ENUM**

# `ToolbarStyle`

```swift
public enum ToolbarStyle: Identifiable, CaseIterable, Codable
```

The style of the toolbar.

## Cases
### `unified`

```swift
case unified
```

The unified toolbar style.

### `unifiedCompact`

```swift
case unifiedCompact
```

The compact version of the unified toolbar style.

### `expanded`

```swift
case expanded
```

The expanded toolbar style.

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

A localized description of the toolbar style.

### `image`

```swift
public var image: some View
```

The image of the toolbar style.

### `asNSToolbarStyle`

```swift
public var asNSToolbarStyle: NSWindow.ToolbarStyle
```

Convert ``ToolbarStyle`` to AppKit's NSWindow.ToolbarStyle.
