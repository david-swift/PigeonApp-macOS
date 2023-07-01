//
//  PigeonCommands.swift
//  PigeonApp
//
//  Created by david-swift on 09.03.23.
//

import SettingsKit
import SwiftUI

/// The commands of a PigeonApp.
struct PigeonCommands: Commands {

    /// The action for opening a window.
    @Environment(\.openWindow)
    var openWindow

    /// The body of the commands.
    var body: some Commands {
        ToolbarCommands()
        CommandGroup(replacing: .appInfo) {
            Button(
                .init(
                    "About \(PigeonModel.shared.pigeonCodeModel.information.appData.name)",
                    comment: "PigeonCommands (About button in the app's menu)"
                )
            ) {
                openWindow(id: .aboutGeneralSettingsTab)
            }
            if !PigeonModel.shared.pigeonCodeModel.information.hidden.contains(.updates) {
                Button(
                    .init(
                        "Updates",
                        comment: "PigeonCommands (Update button in the app's menu"
                    )
                ) {
                    openWindow(id: .updatesSettingsTab)
                }
            }
        }
        CommandGroup(replacing: .help) {
            if let help = PigeonModel.shared.pigeonCodeModel.information.appData.help {
                Link(help.0, destination: help.1)
                    .keyboardShortcut("?")
                Divider()
            }
            ForEach(PigeonModel.shared.pigeonCodeModel.information.appData.links, id: \.1) { link in
                Link(link.0, destination: link.1)
            }
        }
    }

}
