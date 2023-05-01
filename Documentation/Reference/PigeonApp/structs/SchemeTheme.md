**STRUCT**

# `SchemeTheme`

A theme containing a light and a dark theme.

## Properties
### `id`

The identifier.

### `name`

The theme's name.

### `light`

The light theme.

### `dark`

The dark theme.

## Methods
### `init(_:light:dark:)`

The ``SchemeTheme``'s initializer.
- Parameters:
  - name: The theme's name.
  - light: The light theme.
  - dark: The dark theme.

### `activeTheme(scheme:)`

Get the active theme based on the color scheme.
- Parameter scheme: The color scheme (light or dark mode).
- Returns: The theme.
