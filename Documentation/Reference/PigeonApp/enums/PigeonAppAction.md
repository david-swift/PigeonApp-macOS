**ENUM**

# `PigeonAppAction`

Useful actions for interacting with AppKit.

## Methods
### `setAppearance(_:)`

Set the app's theme to light, dark or automatic.
- Parameter appearance: The new theme.

### `setToolbarStyle(displayMode:style:exceptionIDs:)`

Set the toolbar style of all the window except the defined exceptions.
- Parameters:
    - displayMode: The display mode of the toolbars.
    - style: The toolbar style.
    - exceptionIDs: The exception window identifiers.. By default, the settings window is ignored.

### `customizeToolbar(exceptionIDs:)`

Open the customization sheet for the toolbar.
- Parameter exceptionIDs: The exception window identifiers..

### `toggleToolbarHidden(_:exceptionIDs:)`

Toggle the visibility of the toolbar in the windows.
- Parameters:
  - bool: If true, the toolbars are hidden, else, they are visible.
  - exceptionIDs: The exception window identifiers. By default, the settings window is ignored.

### `getKeyWindowID()`

Get the identifier of the key window.
- Returns: The key window's identifier as an optional string.

### `add(_:to:)`

Add a template to a folder.
- Parameters:
  - template: The template.
  - id: The folder's id.

### `add(_:)`

Add a template folder.
- Parameter folder: The template folder
