**STRUCT**

# `AppData`

```swift
public struct AppData
```

Information about an app.

## Properties
### `icon`

```swift
public var icon: Image
```

The app icon.

### `name`

```swift
public var name: String
```

The app's name.

### `description`

```swift
public var description: String?
```

The app's description.

### `links`

```swift
public var links: [(String, URL)]
```

Important links without the link to the documentation.

### `contributors`

```swift
public var contributors: [(String, URL)]
```

The contributors.

### `acknowledgements`

```swift
public var acknowledgements: [(String, URL)]
```

The acknowledgements.

### `versions`

```swift
public var versions: [Version]
```

The app's versions.

### `newestVersion`

```swift
public var newestVersion: String?
```

The newest available Version.

### `downloadLink`

```swift
public var downloadLink: URL?
```

The link for downloading the newest available version.

### `help`

```swift
public var help: (String, URL)?
```

The link to the documentation.

### `supabaseTable`

```swift
public var supabaseTable: String = .init()
```

The name of the table in Supabase.

### `installedVersion`

```swift
public var installedVersion: Version?
```

The installed version of the app.

### `showInformation`

```swift
public var showInformation: Bool
```

Whether the information in Settings > About is visible.
