**EXTENSION**

# `Pigeon`
```swift
extension Pigeon
```

## Properties
### `additionalScenes`

```swift
@SceneBuilder static var additionalScenes: some Scene
```

Additional scenes (next to the main window and settings scene) in a PigeonApp.

## Methods
### `settingsTabWindow(title:id:content:)`

```swift
private static func settingsTabWindow<Content>(
    title: LocalizedStringResource,
    id: String,
    @ViewBuilder content: () -> Content
) -> some Scene where Content: View
```

A window showing a snippet from the settings window.
- Parameters:
  - title: The window's title.
  - id: The window's identifier.
  - content: The content of the window.
- Returns: The window scene.

#### Parameters

| Name | Description |
| ---- | ----------- |
| title | The window’s title. |
| id | The window’s identifier. |
| content | The content of the window. |

### `initAppearance()`

```swift
static func initAppearance()
```

Initialize the appearance on startup.

### `information(description:links:contributors:acknowledgements:)`

```swift
public func information(
    description: String,
    @ArrayBuilder<(String, URL)> links: () -> [(String, URL)],
    @ArrayBuilder<(String, URL)> contributors: () -> [(String, URL)],
    @ArrayBuilder<(String, URL)> acknowledgements: () -> [(String, URL)]
) -> Self
```

Add details about your app.
- Parameters:
  - description: Add a description.
  - links: Add important links such as a website or a repository.
  - contributors: The people that contributed to the app and links to their GitHub account.
  - acknowledgements: Links to packages used in the app and other acknowledgements.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| description | Add a description. |
| links | Add important links such as a website or a repository. |
| contributors | The people that contributed to the app and links to their GitHub account. |
| acknowledgements | Links to packages used in the app and other acknowledgements. |

### `help(_:link:)`

```swift
public func help(_ label: LocalizedStringResource, link: URL) -> Self
```

Set the help link.
- Parameters:
  - label: The help link's label.
  - link: The help link.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The help link’s label. |
| link | The help link. |

### `supabase(data:table:)`

```swift
public func supabase<Data>(data: Binding<Data>, table: String) -> Self where Data: Codable
```

Add data that can be stored in a Supabase repository.
Do also save the data locally.
- Parameters:
  - data: The data to store in the database and update with the database.
  - table: The Supabase table's name.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| data | The data to store in the database and update with the database. |
| table | The Supabase table’s name. |

### `pigeonSettings(_:)`

```swift
public func pigeonSettings(@ArrayBuilder<SettingsTab> _ settings: () -> [SettingsTab]) -> Self
```

Add custom settings tabs.
- Parameter settings: The settings tabs to add.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| settings | The settings tabs to add. |

### `templates(_:)`

```swift
public func templates(@ArrayBuilder<TemplateFolder> _ templates: () -> [TemplateFolder]) -> Self
```

Specify the default templates and activate the templates settings tab.
- Parameter _:  The default templates.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| _ | The default templates. |

### `themes(preview:)`

```swift
public func themes<ThemesView>(
    @ViewBuilder preview: @escaping (SchemeTheme) -> ThemesView
) -> Self where ThemesView: View
```

Add a preview for the themes and activate the themes settings tab.
- Parameter preview: The preivew for the themes.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| preview | The preivew for the themes. |

### `versions(versions:)`

```swift
public func versions(@ArrayBuilder<Version> versions: () -> [Version]) -> Self
```

The app's version history.
- Parameter versions: The versions. The first version is the newest, the last the oldest.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| versions | The versions. The first version is the newest, the last the oldest. |

### `newestVersion(_:)`

```swift
public func newestVersion(_ version: @escaping () async throws -> (String, URL)) -> Self
```

Set the latest app version.
- Parameter version: The tag of the newest available version and the link for downloading it.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| version | The tag of the newest available version and the link for downloading it. |

### `newestVersion(gitHubUser:gitHubRepo:)`

```swift
public func newestVersion(gitHubUser: String, gitHubRepo: String) -> Self
```

Get the latest app version from GitHub releases.
- Parameters:
  - gitHubUser: The owner of the repository.
  - gitHubRepo: The repository.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| gitHubUser | The owner of the repository. |
| gitHubRepo | The repository. |

### `hide(tab:)`

```swift
public func hide(tab: StandardSettingsTab) -> Self
```

Remove a standard settings tab.
- Parameter tab: The settings tab to hide.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tab | The settings tab to hide. |

### `extendAboutView(content:)`

```swift
public func extendAboutView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View
```

Add content to the about subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The content addition. |

### `extendAppearanceView(content:)`

```swift
public func extendAppearanceView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View
```

Add content to the appearance subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The content addition. |

### `extendShortcutsView(content:)`

```swift
public func extendShortcutsView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View
```

Add content to the keyboard shortcuts subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The content addition. |

### `advancedSettings(_:)`

```swift
public func advancedSettings(@ArrayBuilder<SettingsSubtab> _ advancedSettings: () -> [SettingsSubtab]) -> Self
```

Add subtabs to the advanced settings tab.
- Parameter _:  The settings subtabs.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| _ | The settings subtabs. |

### `behaviors(behaviors:)`

```swift
public func behaviors(
    @ArrayBuilder<Behavior> behaviors: @escaping () -> [(LocalizedStringResource, FunctionEditor)]
) -> Self
```

Add the settings tab for editing the app's behaviors.
- Parameter behaviors: The app's behaviors editors.

#### Parameters

| Name | Description |
| ---- | ----------- |
| behaviors | The app’s behaviors editors. |

### `pigeonKeyboardShortcut(_:)`

```swift
public func pigeonKeyboardShortcut(_ shortcut: KeyboardShortcut?) -> some Scene
```

Customize the main window's keyboard shortcut without affecting the settings' keyboard shortcut.
- Parameter shortcut: The new keyboard shortcut of the main window.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| shortcut | The new keyboard shortcut of the main window. |

### `editInformation(edit:)`

```swift
private func editInformation(edit: (inout CodeInformation) -> Void) -> Self
```

Edit information about the app.
- Parameter edit: The edit.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

#### Parameters

| Name | Description |
| ---- | ----------- |
| edit | The edit. |