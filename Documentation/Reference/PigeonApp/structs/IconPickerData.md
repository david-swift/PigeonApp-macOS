**STRUCT**

# `IconPickerData`

The data for an icon picker.

## Properties
### `hover`

The hovered symbol.

### `popoverPresented`

Stores whether the popover is presented.

### `symbolFilter`

The filtered symbol as a String.

### `symbolFilterMatchStyle`

The match style of the ``symbolFilter``.

## Methods
### `init()`

The initializer.
It hides the popover, sets the symbol filter to an empty string
and the match style to ``KeywordsMatchStyle.all``.

### `removeDots()`

Replace the dots in the ``symbolFilter`` with whitespaces.
While the SFSymbols are defined with dots, this app uses spaces.
