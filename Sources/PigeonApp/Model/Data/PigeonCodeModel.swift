//
//  PigeonCodeModel.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import SettingsKit
import SwiftUI

/// Options for Pigeon defined by the coder.
public struct PigeonCodeModel {

    /// Information about the app.
    public var information: CodeInformation

    /// Get the settings tabs.
    var settings: [SettingsTab] {
        getSettings()
    }

    /// The initializer for ``PigeonCodeModel``.
    /// - Parameters:
    ///   - information: Information defined by the coder.
    init(information: CodeInformation) {
        self.information = information
    }

    /// Set the code information.
    /// - Parameter information: The new code information.
    mutating func setSettings(information: CodeInformation) {
        self.information = information
    }

    /// Get the settings tabs.
    /// - Returns: The settings tabs.
    func getSettings() -> [SettingsTab] {
        var settings: [SettingsTab] = []
        var firstSettings: [StandardSettingsTab] = [.general]
        if !PigeonModel.shared.behaviors.isEmpty {
            firstSettings.append(.behaviors)
        }
        if PigeonModel.shared.supabaseData != nil {
            firstSettings.append(.synchronization)
        }
        if information.templatesActive {
            firstSettings.append(.templates)
        }
        firstSettings = firstSettings.filter { !information.hidden.contains($0) }
        settings = firstSettings
            .map { $0.settingsTab }

        settings += information.tabs

        var lastSettings: [StandardSettingsTab] = [.updates]
        if information.themesPreview != nil {
            lastSettings.insert(.themes, at: 0)
        }
        if !information.advancedSettings.isEmpty {
            lastSettings.append(.advanced)
        }
        lastSettings = lastSettings.filter { !information.hidden.contains($0) }
        settings += lastSettings.map { $0.settingsTab }

        return settings
    }

}
