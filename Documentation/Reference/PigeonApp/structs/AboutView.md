**STRUCT**

# `AboutView`

```swift
struct AboutView: View
```

A view showing information about the app.

## Properties
### `appData`

```swift
var appData: AppData
```

Information about the app.

### `body`

```swift
var body: some View
```

The view's body.

### `overview`

```swift
@ViewBuilder var overview: some View
```

General information about the app.

### `information`

```swift
@ViewBuilder var information: some View
```

More detailed information about the app.

### `description`

```swift
@ViewBuilder var description: some View
```

A short description of the app's function.

### `links`

```swift
@ViewBuilder var links: some View
```

Links to websites related to the app.

### `contributors`

```swift
@ViewBuilder var contributors: some View
```

A list of the app's contributors.

### `acknowledgements`

```swift
@ViewBuilder var acknowledgements: some View
```

A list of packages used in the app and other acknowledgements.

## Methods
### `imageURL(link:)`

```swift
private func imageURL(link: URL) -> String
```

Get the URL to the contributor's image from the URL to their GitHub account.
- Parameter link: The URL to their GitHub account.
- Returns: The URL to the image as a string.

#### Parameters

| Name | Description |
| ---- | ----------- |
| link | The URL to their GitHub account. |