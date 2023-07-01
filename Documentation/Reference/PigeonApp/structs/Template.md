**STRUCT**

# `Template`

```swift
public struct Template: Identifiable, Codable, SelectionItem
```

A template.

## Properties
### `id`

```swift
public let id: UUID
```

The template's identifier.

### `title`

```swift
public var title: String
```

The template's title.

### `icon`

```swift
public var icon: SFSymbol
```

The template's icon.

### `content`

```swift
public var content: Data
```

Content of the template.

## Methods
### `init(title:icon:content:)`

```swift
public init(title: String, icon: SFSymbol, content: Data)
```

Initialize a new template.
- Parameters:
  - title: The template's title.
  - icon: The template's icon.
  - content: The content of the template.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The template’s title. |
| icon | The template’s icon. |
| content | The content of the template. |