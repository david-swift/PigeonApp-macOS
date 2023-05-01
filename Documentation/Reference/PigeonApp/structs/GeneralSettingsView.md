**STRUCT**

# `GeneralSettingsView`

The content of a settings subtab with a preview image and the controls.

## Properties
### `scrollDisabled`

Whether scrolling is enabled in the current state.

### `overview`

The overview image.

### `scrollText`

The scroll text.

### `content`

The controls.

### `body`

The view's body.

## Methods
### `init(text:overview:content:)`

The initializer of ``GeneralSettingsView``.
- Parameters:
  - text: The text of the scroll button.
  - overview: The preview image.
  - content: The controls.

### `header(scrollView:)`

The overview and the button for scrolling.
- Parameter scrollView: The scroll view proxy for automatically scrolling down.
- Returns: A view containing the overview and the scroll button.
