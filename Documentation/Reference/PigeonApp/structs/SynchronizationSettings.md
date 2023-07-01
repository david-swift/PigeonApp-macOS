**STRUCT**

# `SynchronizationSettings`

```swift
struct SynchronizationSettings: View
```

The synchronization settings view.

## Properties
### `model`

```swift
@StateObject private var model = PigeonModel.shared
```

An instance of ``PigeonModel``.
It stores values that are the same in the whole app.

### `body`

```swift
var body: some View
```

The view's body.

### `table`

```swift
private var table: String
```

The Supabase table's name.

### `textFields`

```swift
private var textFields: some View
```

The text fields for editing the Supabase data.

### `steps1To5`

```swift
private var steps1To5: some View
```

The first five tutorial steps.

### `steps6To10`

```swift
private var steps6To10: some View
```

Tutorial steps 6 to 10.

### `steps11To15`

```swift
private var steps11To15: some View
```

The last five tutorial steps.

### `color`

```swift
private var color: Color
```

The success badge's color.
