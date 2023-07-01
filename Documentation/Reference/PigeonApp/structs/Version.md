**STRUCT**

# `Version`

```swift
public struct Version
```

A version of the app.

## Properties
### `tag`

```swift
var tag: String
```

The version's tag.

### `date`

```swift
var date: Date
```

The release date.

### `features`

```swift
var features: [Feature]
```

The new features.

### `download`

```swift
var download: URL?
```

The download link.

## Methods
### `init(_:date:download:features:)`

```swift
public init(_ tag: String, date: Date, download: URL? = nil, @ArrayBuilder<Feature> features: () -> [Feature])
```

The version's initializer.
- Parameters:
  - tag: The version's tag.
  - date: The release date.
  - download: The download link.
  - features: The new features.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tag | The version’s tag. |
| date | The release date. |
| download | The download link. |
| features | The new features. |