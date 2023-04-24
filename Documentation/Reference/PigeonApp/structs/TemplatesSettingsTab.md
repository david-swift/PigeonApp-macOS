**STRUCT**

# `TemplatesSettingsTab`

```swift
struct TemplatesSettingsTab: View
```

A settings subtab for editing a folder.

## Properties
### `group`

```swift
@Binding var group: TemplateFolder
```

The active template folder.

### `showGroupIcons`

```swift
@State private var showGroupIcons = false
```

Whether the group icons picker overlay is displayed.

### `showTemplateIcons`

```swift
@State private var showTemplateIcons = false
```

Whether the template icons picker overlay is displayed.

### `filter`

```swift
@State private var filter = ""
```

The filter of the icons.

### `selection`

```swift
@State private var selection: UUID?
```

The selected template.

### `delete`

```swift
@State private var delete = false
```

Whether the delete overlay is displayed.

### `icons`

```swift
let icons = Array(SFSymbol.allSymbols).filter { !$0.rawValue.hasSuffix(".fill") }
```

All of the available ``SFSymbol`` icons.

### `body`

```swift
var body: some View
```

The view's body.

### `folder`

```swift
var folder: some View
```

The section for editing the folder.

### `content`

```swift
var content: some View
```

The section for editing the templates.

## Methods
### `templatePopover(selection:)`

```swift
func templatePopover(selection: UUID) -> some View
```

The popover with the template editing options.
- Parameter selection: The selected template.
- Returns: The editing view.

#### Parameters

| Name | Description |
| ---- | ----------- |
| selection | The selected template. |

### `iconTitlePicker(title:icon:showIcons:)`

```swift
func iconTitlePicker(title: Binding<String>, icon: Binding<SFSymbol>, showIcons: Binding<Bool>) -> some View
```

A button for opening the popover for selecting an icon and a text field next to it.
- Parameters:
  - title: The text of the text field.
  - icon: The selected icon.
  - showIcons: Whether the icon popover is visible.
- Returns: A view containing the button and text field.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The text of the text field. |
| icon | The selected icon. |
| showIcons | Whether the icon popover is visible. |

### `iconPopover(icon:showIcons:)`

```swift
func iconPopover(icon: Binding<SFSymbol>, showIcons: Binding<Bool>) -> some View
```

A popover for selecting ``SFSymbol`` icons.
- Parameters:
  - icon: The selected symbol.
  - showIcons: Whether this view is visible.
- Returns: A view for selecting ``SFSymbol`` icons.

#### Parameters

| Name | Description |
| ---- | ----------- |
| icon | The selected symbol. |
| showIcons | Whether this view is visible. |