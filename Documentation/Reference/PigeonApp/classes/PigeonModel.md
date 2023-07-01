**CLASS**

# `PigeonModel`

```swift
public class PigeonModel: ObservableObject
```

This class manages the data used in the default settings and menu bar.

## Properties
### `shared`

```swift
static var shared = PigeonModel()
```

A shared instance of the ``PigeonModel``.

### `settings`

```swift
@Published public var settings: PigeonSettingsData
```

The data used for customizing the user experience.

### `pigeonCodeModel`

```swift
@Published public var pigeonCodeModel: PigeonCodeModel
```

Data defined by the coder.

### `behaviors`

```swift
@Published var behaviors: [(LocalizedStringResource, FunctionEditor)]
```

The behaviors.

### `synchronizationSuccess`

```swift
@Published var synchronizationSuccess: (Bool, String) = (false, .init())
```

Whether the last synchronization task succeeded and, if not, the error message.

### `gotData`

```swift
@Published var gotData = false
```

Whether the data is already synchronized.

### `supabaseData`

```swift
@Published var supabaseData: Data?
```

The data for synchronization with the Supabase database.

### `updateSupabaseData`

```swift
@Published var updateSupabaseData: (Data) -> Void = { _ in }
```

A closure for updating the local data from the Supabase database.

## Methods
### `init(information:templates:)`

```swift
init(information: CodeInformation = .init(), templates: [TemplateFolder] = [])
```

The initializer of a ``PigeonModel``.
- Parameters:
  - information: Information defined by the coder.
  - templates: The template groups.

#### Parameters

| Name | Description |
| ---- | ----------- |
| information | Information defined by the coder. |
| templates | The template groups. |

### `setSettings(information:)`

```swift
func setSettings(information: CodeInformation)
```

Set the settings.
- Parameter information: The code information.

#### Parameters

| Name | Description |
| ---- | ----------- |
| information | The code information. |

### `set()`

```swift
func set()
```

Set the appearance and the toolbar style.

### `setData()`

```swift
func setData()
```

Update the data in the Supabase database.

### `getData()`

```swift
func getData()
```

Update the local data from the Supabase database.
