//
//  PigeonSettingsData.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import Supabase
import SwiftUI

/// Data used for customizing the user experience.
public struct PigeonSettingsData: Codable {

    /// The standard settings tab.
    public var standardSettingsTab: String = StandardSettingsTab.general.id
    /// The standard settings subtab.
    public var standardSettingsSubtab: String = .aboutGeneralSettingsTab
    /// The available templates.
    public var templates: [TemplateFolder]
    /// The appearance of the UI.
    public var appearance: Appearance = .auto
    /// The toolbar style in the windows except the settings window.
    public var toolbarStyle: ToolbarStyle = .unified
    /// The display mode of the elements in the toolbar.
    public var toolbarDisplayMode: ToolbarDisplayMode = .iconOnly
    /// Use filled icons.
    public var iconFill = true
    /// The themes.
    public var themes: [SchemeTheme]
    /// The selected theme.
    public var selectedTheme: UUID
    /// The date of the last update reminder.
    public var lastUpdateReminder: Date?
    /// The URL for the Supabase database.
    public var supabaseURL: String = .init()
    /// The key for the Supabase database.
    public var supabaseKey: String = .init()
    /// The ID for the Supabase table row.
    public var supabaseRowID: Int = 0

    /// The Supabase client.
    var client: SupabaseClient? {
        if let url = URL(string: supabaseURL) {
            return .init(supabaseURL: url, supabaseKey: supabaseKey)
        }
        PigeonModel.shared.synchronizationSuccess = (false, .init(localized: .init(
            "\"\(supabaseURL)\" is not a valid URL.",
            comment: "AppModel (String to URL conversion error)"
        )))
        return nil
    }

    /// Initialize the pigeon settings data.
    /// - Parameter templates: The templates.
    init(templates: [TemplateFolder]) {
        let themes = [
            SchemeTheme(
                .init(localized: .init(
                    "Default",
                    comment: "PigeonSettingsData (The default theme)"
                )),
                light: Theme(),
                dark: Theme()
            )
        ]
        self.themes = themes
        selectedTheme = themes.first?.id ?? .init()
        self.templates = templates
    }

}
