//
//  String.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//
//  swiftlint:disable string_literals

import SwiftUI

extension String {

    /// The filename extension of a PNG image.
    static var png: Self { "png" }
    /// The id of the controls section of a ``GeneralSettingsView``.
    static var information: Self { "information" }
    /// The settings user defaults key.
    static var settingsData: Self { "settings-data" }

    /// The identifier of the general settings subtab "About".
    static var aboutGeneralSettingsTab: Self { "about" }
    /// The identifier of the general settings subtab "Appearance".
    static var appearanceGeneralSettingsTab: Self { "appearance" }
    /// The identifier of the general settings subtab "Keyboard Shortcuts".
    static var keyboardShortcutsGeneralSettingsTab: Self { "shortcuts" }
    /// The identifier of the subtab "Updates" in the settings tab "Updates".
    static var updatesSettingsTab: Self { "updates" }

    /// Get the image of a package resource.
    /// The string has to be the name of a resource image.
    var packageResourceImage: some View {
        Group {
            if let path = Bundle.module.path(forResource: self, ofType: .png),
                let image = NSImage(contentsOfFile: path) {
                Image(nsImage: image)
                    .resizable()
                    .frame(
                        width: image.size.width / .packageResourceImageDivisionFactor,
                        height: image.size.height / .packageResourceImageDivisionFactor
                    )
            }
        }
    }

}

//  swiftlint:enable string_literals
