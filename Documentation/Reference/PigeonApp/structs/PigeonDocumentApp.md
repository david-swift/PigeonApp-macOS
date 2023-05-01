**STRUCT**

# `PigeonDocumentApp`

A PigeonDocumentApp is a SwiftUI app with a certain organization in the settings window and menu bar.
It is basically a PigeonApp but using SwiftUI.DocumentGroup instead of SwiftUI.WindowGroup.

## Properties
### `pigeonModel`

The Pigeon Model handles the data.

### `newDocument`

The document that is created when the user taps the "New" button.

### `content`

The content of the main window in a ``PigeonDocumentApp``.

### `body`

The main scene of a PigeonDocumentApp.

## Methods
### `init(appName:appIcon:document:content:)`

The public initializer with all the three views specified.
- Parameters:
  - appName: The app's name.
  - appIcon: The app's icon.
  - document: The document that is created when the user taps the "New" button.
  - content: The content of the main window in a ``PigeonDocumentApp``.

### `view(_:document:)`

Fill in the document in al view function.
- Parameters:
  - view: The view function.
  - document: The document to fill in.
- Returns: The view function without the document parameter.
