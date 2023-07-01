**STRUCT**

# `VersionView`

```swift
struct VersionView: View
```

Information about a version in the version settings tab.

## Properties
### `version`

```swift
var version: Version
```

The version to show information about.

### `newVersion`

```swift
var newVersion: String?
```

If there is a new uninstalled version available, this is the version number.

### `downloadLink`

```swift
var downloadLink: URL?
```

If there is a new uninstalled version available, this is the download link.

### `body`

```swift
var body: some View
```

The view's body.
