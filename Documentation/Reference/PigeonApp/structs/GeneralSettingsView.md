**STRUCT**

# `GeneralSettingsView`

```swift
public struct GeneralSettingsView<Overview, Content>: View where Overview: View, Content: View
```

The content of a settings subtab with a preview image and the controls.

## Properties
### `scrollDisabled`

```swift
@State private var scrollDisabled = true
```

Whether scrolling is enabled in the current state.

### `overview`

```swift
var overview: Overview
```

The overview image.

### `scrollText`

```swift
var scrollText: LocalizedStringResource?
```

The scroll text.

### `content`

```swift
var content: Content
```

The controls.

### `body`

```swift
public var body: some View
```

The view's body.

## Methods
### `init(text:overview:content:)`

```swift
public init(
    text: LocalizedStringResource?,
    @ViewBuilder overview: () -> Overview,
    @ViewBuilder content: () -> Content
)
```

The initializer of ``GeneralSettingsView``.
- Parameters:
  - text: The text of the scroll button.
  - overview: The preview image.
  - content: The controls.

#### Parameters

| Name | Description |
| ---- | ----------- |
| text | The text of the scroll button. |
| overview | The preview image. |
| content | The controls. |

### `header(scrollView:)`

```swift
private func header(scrollView: ScrollViewProxy) -> some View
```

The overview and the button for scrolling.
- Parameter scrollView: The scroll view proxy for automatically scrolling down.
- Returns: A view containing the overview and the scroll button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| scrollView | The scroll view proxy for automatically scrolling down. |