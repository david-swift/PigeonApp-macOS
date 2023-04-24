//
//  ThemesSettings.swift
//  PigeonApp
//
//  Created by david-swift on 02.03.23.
//

import SwiftUI

/// A settings subtab for editing a theme.
struct ThemesSettings: View {

    /// The shared instance of the ``PigeonModel``.
    @StateObject private var model = PigeonModel.shared
    /// The selected theme.
    @Binding var theme: SchemeTheme

    /// The view's body.
    var body: some View {
        GeneralSettingsView(
            text: .init("Customize", comment: "ThemesSettings (Button for customizing)")
        ) {
            PigeonModel.shared.pigeonCodeModel.information.themesPreview?(theme)
        } content: {
            Section(.init("Theme", comment: "ThemeSettings (Section of information about a scheme theme)")) {
                Toggle(
                    String(localized: .init(
                        "Active Theme",
                        comment: "ThemeSettings (Label of toggle for changing the active theme)"
                    )),
                    isOn: (model.settings.selectedTheme == theme.id).binding { newValue in
                        if newValue {
                            model.settings.selectedTheme = theme.id
                        }
                    }
                )
                TextField(
                    .init(
                        "Title",
                        comment: "ThemesSettings (Text field for the scheme theme's title)"
                    ),
                    text: $theme.name
                )

            }
            Section(.init("Light", comment: "ThemesSettings (Section of the light theme)")) {
                customizeThemeView(theme: $theme.light)
            }
            Section(.init("Dark", comment: "ThemesSettings (Section of the dark theme)")) {
                customizeThemeView(theme: $theme.dark)
            }
        }

    }

    /// The view for customizing a theme.
    /// - Parameter theme: The theme to customize.
    /// - Returns: A view containing the controls for customizing a theme.
    @ViewBuilder
    func customizeThemeView(theme: Binding<Theme>) -> some View {
        HStack {
            ColorPicker(String(localized: .init(
                "Primary",
                comment: "ThemesSettings (Color picker for the primary accent color)"
            )), selection: theme.primaryAccent)
            ColorPicker(String(localized: .init(
                "Secondary",
                comment: "ThemesSettings (Color picker for the secondary accent color)"
            )), selection: theme.secondaryAccent)
            ColorPicker(String(localized: .init(
                "Tertiary",
                comment: "ThemesSettings (Color picker for the tertiary accent color)"
            )), selection: theme.tertiaryAccent)
            ColorPicker(String(localized: .init(
                "Quaternary",
                comment: "ThemesSettings (Color picker for the quaternary accent color)"
            )), selection: theme.quaternaryAccent)
            ColorPicker(String(localized: .init(
                "Quinary",
                comment: "ThemesSettings (Color picker for the quinary accent color)"
            )), selection: theme.quinaryAccent)
            ColorPicker(String(localized: .init(
                "Background",
                comment: "ThemesSettings (Color picker for the background color)"
            )), selection: theme.background)
        }
        .labelsHidden()
    }

}

/// The previews for ``ThemeSettings``.
struct ThemesSettings_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        ThemesSettings(theme: .constant(.init("Test", light: .init(), dark: .init())))
    }

}
