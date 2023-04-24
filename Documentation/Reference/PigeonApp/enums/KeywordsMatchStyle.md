**ENUM**

# `KeywordsMatchStyle`

```swift
public enum KeywordsMatchStyle
```

Defines which elements in a search match:
Elements that contain all the search elements,
elements that contain one or more of the search elements
or the search is done with regular expressions.

## Cases
### `all`

```swift
case all
```

Matches elements that contain all the search elements.

### `one`

```swift
case one
```

Matches elements that contain at least one of the search elements.

### `regex`

```swift
case regex
```

Matches elements that match the regular expression.

## Properties
### `localized`

```swift
public var localized: LocalizedStringResource
```

The localized name of the match style.
