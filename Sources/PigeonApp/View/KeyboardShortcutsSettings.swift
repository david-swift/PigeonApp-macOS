//
//  KeyboardShortcutsSettings.swift
//  PigeonApp
//
//  Created by david-swift on 12.03.23.
//

import SettingsKit
import SwiftUI

/// The keyboard shortcut settings.
struct KeyboardShortcutsSettings: View {

    /// The shared ``PigeonModel``.
    @StateObject private var model = PigeonModel.shared
    /// The active color scheme.
    @Environment(\.colorScheme)
    var colorScheme

    /// The view's body.
    var body: some View {
        GeneralSettingsView(text: .init(
            "Edit Shortcuts",
            comment: "KeyboardShortcutsSettings (Button for showing the available options)"
        )) {
            ZStack {
                switch colorScheme {
                case .dark:
                    "KeyboardShortcutsDark".packageResourceImage
                default:
                    "KeyboardShortcutsLight".packageResourceImage
                }
            }
        } content: {
            Section(.init("Settings", comment: "KeyboardShortcutsSettings (Section for the settings)") ) {
                standardSettingsTab
                standardSettingsSubtab
            }
            AnyView(model.pigeonCodeModel.information.shortcutsView)
        }
    }

    /// The active standard settings tab.
    private var selectedTab: SettingsTab? {
        var selectedTab = model.pigeonCodeModel.settings.first { $0.id == model.settings.standardSettingsTab }
        for tab in model.pigeonCodeModel.settings {
            if case let .extend(extendedTab) = tab.type, extendedTab == selectedTab?.id {
                selectedTab?.content += tab.content
            }
        }
        return selectedTab
    }

    /// The control for changing the standard settings tab.
    private var standardSettingsTab: some View {
        Picker(
            selection: $model.settings.standardSettingsTab
        ) {
            ForEach(model.pigeonCodeModel.settings) { tab in
                if case let .new(label) = tab.type {
                    label
                        .labelStyle(.titleOnly)
                        .tag(tab.id)
                }
            }
        } label: {
            Text(.init(
                "Standard Settings Tab",
                comment: "KeyboardShortcutsSettings (Picker for the standard settings tab)"
            ))
            Text(.init(
                "The settings tab that is opened with ⌘,.",
                comment: "KeyboardShortcutsSettings (Description of the picker for the standard settings tab)"
            ))
        }
        .onChange(of: model.settings.standardSettingsTab) { newValue in
            if selectedTab?.content.contains(
                where: { $0.id == newValue }
            ) == false, let first = selectedTab?.content.first(where: { tab in
                switch tab.type {
                case .new:
                    return true
                default:
                    return false
                }
            }) {
                model.settings.standardSettingsSubtab = first.id
            }
        }
    }

    /// The control for changing the standard settings subtab.
    @ViewBuilder private var standardSettingsSubtab: some View {
        if let selectedTab, selectedTab.content.count > 1 {
            Picker(
                selection: $model.settings.standardSettingsSubtab
            ) {
                ForEach(selectedTab.content) { tab in
                    if case let .new(label) = tab.type {
                        label
                            .labelStyle(.titleOnly)
                            .tag(tab.id)
                    }
                }
            } label: {
                Text(.init(
                    "Standard Settings Subtab",
                    comment: "KeyboardShortcutsSettings (Picker for the standard settings subtab)"
                ))
                Text(.init(
                    "The settings subtab that is opened with ⌘,.",
                    comment: "KeyboardShortcutsSettings (Description of the picker for the standard settings subtab)"
                ))
            }
        }
    }

}

/// The previews for the ``KeyboardShortcutsSettings``.
struct KeyboardShortcutsSettings_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        KeyboardShortcutsSettings()
    }

}
