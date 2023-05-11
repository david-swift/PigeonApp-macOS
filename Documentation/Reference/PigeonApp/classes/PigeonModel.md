**CLASS**

# `PigeonModel`

This class manages the data used in the default settings and menu bar.

## Properties
### `shared`

A shared instance of the ``PigeonModel``.

### `settings`

The data used for customizing the user experience.

### `pigeonCodeModel`

Data defined by the coder.

### `behaviors`

The behaviors.

### `synchronizationSuccess`

Whether the last synchronization task succeeded and, if not, the error message.

### `gotData`

Whether the data is already synchronized.

### `supabaseData`

The data for synchronization with the Supabase database.

### `updateSupabaseData`

A closure for updating the local data from the Supabase database.

## Methods
### `init(information:templates:)`

The initializer of a ``PigeonModel``.
- Parameters:
  - information: Information defined by the coder.
  - templates: The template groups.

### `setSettings(information:)`

Set the settings.
- Parameter information: The code information.

### `set()`

Set the appearance and the toolbar style.

### `setData()`

Update the data in the Supabase database.

### `getData()`

Update the local data from the Supabase database.
