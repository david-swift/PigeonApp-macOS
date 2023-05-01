**STRUCT**

# `TemplatesSettingsTab`

A settings subtab for editing a folder.

## Properties
### `group`

The active template folder.

### `showGroupIcons`

Whether the group icons picker overlay is displayed.

### `showTemplateIcons`

Whether the template icons picker overlay is displayed.

### `filter`

The filter of the icons.

### `selection`

The selected template.

### `delete`

Whether the delete overlay is displayed.

### `icons`

All of the available ``SFSymbol`` icons.

### `body`

The view's body.

### `folder`

The section for editing the folder.

### `content`

The section for editing the templates.

## Methods
### `templatePopover(selection:)`

The popover with the template editing options.
- Parameter selection: The selected template.
- Returns: The editing view.

### `iconTitlePicker(title:icon:showIcons:)`

A button for opening the popover for selecting an icon and a text field next to it.
- Parameters:
  - title: The text of the text field.
  - icon: The selected icon.
  - showIcons: Whether the icon popover is visible.
- Returns: A view containing the button and text field.

### `iconPopover(icon:showIcons:)`

A popover for selecting ``SFSymbol`` icons.
- Parameters:
  - icon: The selected symbol.
  - showIcons: Whether this view is visible.
- Returns: A view for selecting ``SFSymbol`` icons.
