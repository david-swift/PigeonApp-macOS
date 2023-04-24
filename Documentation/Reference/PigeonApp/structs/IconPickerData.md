**STRUCT**

# `IconPickerData`

```swift
public struct IconPickerData
```

The data for an icon picker.

## Properties
### `hover`

```swift
public var hover: SFSymbol?
```

The hovered symbol.

### `popoverPresented`

```swift
public var popoverPresented: Bool
```

Stores whether the popover is presented.

### `symbolFilter`

```swift
public var symbolFilter: String
```

The filtered symbol as a String.

### `symbolFilterMatchStyle`

```swift
public var symbolFilterMatchStyle: KeywordsMatchStyle
```

The match style of the ``symbolFilter``.

## Methods
### `init()`

```swift
init()
```

The initializer.
It hides the popover, sets the symbol filter to an empty string
and the match style to ``KeywordsMatchStyle.all``.

### `removeDots()`

```swift
mutating func removeDots()
```

Replace the dots in the ``symbolFilter`` with whitespaces.
While the SFSymbols are defined with dots, this app uses spaces.
