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
            AnyView(model.pigeonCodeModel.information.shortcutsView)
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
