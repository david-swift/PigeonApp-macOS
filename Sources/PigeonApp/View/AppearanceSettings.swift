//
//  AppearanceSettings.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import SwiftUI

/// The appearance settings.
struct AppearanceSettings: View {

    /// The color scheme.
    @Environment(\.colorScheme)
    var colorScheme
    /// The shared ``PigeonModel``.
    @StateObject private var model = PigeonModel.shared

    /// The view's body.
    var body: some View {
        GeneralSettingsView(
            text: .init("Customize", comment: "ApperanceSettings (Button for customizing appearance)")
        ) {
            ZStack {
                if colorScheme == .dark {
                    "DarkBackground".packageResourceImage
                    switch model.settings.toolbarDisplayMode {
                    case .iconAndText:
                        "IconAndTextDark".packageResourceImage
                    default:
                        "SingleItemDark".packageResourceImage
                    }
                } else {
                    "LightBackground".packageResourceImage
                    switch model.settings.toolbarDisplayMode {
                    case .iconAndText where model.settings.toolbarStyle != .unifiedCompact:
                        "IconAndTextLight".packageResourceImage
                    default:
                        "SingleItemLight".packageResourceImage
                    }
                }
                switch model.settings.appearance {
                case .light:
                    "LightIcon".packageResourceImage
                case .dark:
                    "DarkIcon".packageResourceImage
                default:
                    Color.clear
                }
            }
        } content: {
            themeSection
            iconsSection
            toolbarSection
            AnyView(model.pigeonCodeModel.information.appearanceView)
        }
    }

    /// The section for selecting the color scheme.
    private var themeSection: some View {
        Section(.init("Theme", comment: "AppearanceSettings (The theme section)")) {
            HStack {
                ForEach(Appearance.allCases) { appearance in
                    Button {
                        model.settings.appearance = appearance
                    } label: {
                        appearance.image
                    }
                    .buttonStyle(.settingsImage(
                        isSelected: appearance == model.settings.appearance
                    ))
                    .help(appearance.localized.localized)
                }
            }
            .animation(.default, value: model.settings.appearance)
        }
    }

    /// The section for selecting the icon style.
    private var iconsSection: some View {
        Section(.init("Icons", comment: "AppearanceSettings (The icons section)") ) {
            Toggle(isOn: $model.settings.iconFill) {
                Text(.init("Filled Icons", comment: "AppearanceSettings (Toggle for changing the icon fill)"))
                Text(.init(
                    "Change the style of the icons in the user interface.",
                    comment: "AppearanceSettings (Description of toggle for changing the icon fill)"
                ))
            }
        }
    }

    /// The section for customizing the toolbar.
    private var toolbarSection: some View {
        Section(.init("Toolbar", comment: "AppearanceSettings (The toolbar section)") ) {
            toolbarStyle
            displayMode
            customizeToolbar
            showHideToolbar
        }
    }

    /// The controls for changing the toolbar style.
    private var toolbarStyle: some View {
        HStack {
            ForEach(ToolbarStyle.allCases) { style in
                Button {
                    model.settings.toolbarStyle = style
                } label: {
                    style.image
                }
                .buttonStyle(.settingsImage(isSelected: style == model.settings.toolbarStyle))
                .help(style.localized.localized)
            }
        }
    }

    /// The controls for changing the toolbar's display mode.
    private var displayMode: some View {
        Picker(
            selection: displayModeSelection.binding { newValue in
                model.settings.toolbarDisplayMode = newValue
            }
        ) {
            ForEach(ToolbarDisplayMode.allCases) { mode in
                if mode != .textOnly || model.settings.toolbarStyle != .expanded {
                    Text(mode.localized)
                        .tag(mode)
                }
            }
        } label: {
            Text(.init("Display Mode", comment: "AppearanceSettings (Picker for changing the toolbar display mode)"))
            Text(.init(
                "Add a description to the icon in the toolbar.",
                comment: "AppearanceSettings (Description of picker for changing the toolbar display mode)"
            ))
        }
        .disabled(isUnified)
    }

    /// The controls for customizing the toolbar.
    private var customizeToolbar: some View {
        Button("Customize Toolbar..." as String) {
            try? PigeonAppAction.customizeToolbar()
        }
    }

    /// The controls for toggling the toolbar's appearance in every open window.
    private var showHideToolbar: some View {
        ControlGroup {
            showToolbar
            hideToolbar
        }
    }

    /// The button for showing the toolbar.
    private var showToolbar: some View {
        Button(.init("Show Toolbar", comment: "AppearanceSettings (Button for enabling the toolbars)") ) {
            PigeonAppAction.toggleToolbarHidden(false)
        }
    }

    /// The button for hiding the toolbar.
    private var hideToolbar: some View {
        Button(.init("Hide Toolbar", comment: "AppearanceSettings (Button for hiding the toolbars)") ) {
            PigeonAppAction.toggleToolbarHidden(true)
        }
    }

    /// Whether the toolbar style is unified.
    private var isUnified: Bool {
        model.settings.toolbarStyle == .unifiedCompact
    }

    /// The toolbar display mode.
    private var displayModeSelection: ToolbarDisplayMode {
        isUnified ? .iconOnly : model.settings.toolbarDisplayMode
    }

}

/// Previews for the appearance settings.
struct AppearanceSettingsPreview: PreviewProvider {

    /// The preview.
    static var previews: some View {
        AppearanceSettings()
    }

}
