**EXTENSION**

# `Pigeon`

## Methods
### `shortcut(tab:)`

Add a shortcut to a settings tab.
- Parameter tab: The settings tab without the shortcut.
- Returns: The settings tab with the shortcut.

### `initAppearance()`

Initialize the appearance on startup.

### `information(description:links:contributors:acknowledgements:)`

Add details about your app.
- Parameters:
  - description: Add a description.
  - links: Add important links such as a website or a repository.
  - contributors: The people that contributed to the app and links to their GitHub account.
  - acknowledgements: Links to packages used in the app and other acknowledgements.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `help(_:link:)`

Set the help link.
- Parameters:
  - label: The help link's label.
  - link: The help link.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `supabase(data:table:)`

Add data that can be stored in a Supabase repository.
Do also save the data locally.
- Parameters:
  - data: The data to store in the database and update with the database.
  - table: The Supabase table's name.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `pigeonSettings(_:)`

Add custom settings tabs.
- Parameter settings: The settings tabs to add.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `templates(_:)`

Specify the default templates and activate the templates settings tab.
- Parameter _:  The default templates.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `themes(preview:)`

Add a preview for the themes and activate the themes settings tab.
- Parameter preview: The preivew for the themes.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `versions(versions:)`

The app's version history.
- Parameter versions: The versions. The first version is the newest, the last the oldest.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `newestVersion(_:)`

Set the latest app version.
- Parameter version: The tag of the newest available version and the link for downloading it.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `newestVersion(gitHubUser:gitHubRepo:)`

Get the latest app version from GitHub releases.
- Parameters:
  - gitHubUser: The owner of the repository.
  - gitHubRepo: The repository.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `hide(tab:)`

Remove a standard settings tab.
- Parameter tab: The settings tab to hide.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `extendAboutView(content:)`

Add content to the about subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `extendAppearanceView(content:)`

Add content to the appearance subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `extendShortcutsView(content:)`

Add content to the keyboard shortcuts subtab in the general settings.
- Parameter content: The content addition.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `advancedSettings(_:)`

Add subtabs to the advanced settings tab.
- Parameter _:  The settings subtabs.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.

### `behaviors(behaviors:)`

Add the settings tab for editing the app's behaviors.
- Parameter behaviors: The app's behaviors editors.

### `editInformation(edit:)`

Edit information about the app.
- Parameter edit: The edit.
- Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
