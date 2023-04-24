**STRUCT**

# `TemplateFolder`

```swift
public struct TemplateFolder: Codable, Bindable, Identifiable
```

A folder of templates.

## Properties
### `id`

```swift
public let id: UUID
```

The folder's identifier.

### `title`

```swift
public var title: String
```

The folder's title.

### `icon`

```swift
var icon: SFSymbol
```

The folder's icon.

### `templates`

```swift
var templates: [Template]
```

The templates.

### `folder`

```swift
var folder: Folder<Template>
```

The template folder as a ``Folder``.

## Methods
### `init(title:icon:templates:)`

```swift
public init(title: String, icon: SFSymbol, @ArrayBuilder<Template> templates: () -> [Template])
```

Initialize a ``TemplateFolder``.
- Parameters:
  - title: The template folder's title.
  - icon: The template folder's icon.
  - templates: The content.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The template folder’s title. |
| icon | The template folder’s icon. |
| templates | The content. |