//
//  CodeInformation.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import SettingsKit
import SwiftUI

/// Information about the app defined by the developer.
public struct CodeInformation {

    /// The custom settings tabs.
    var tabs: [SettingsTab] = []
    /// Information about the app.
    var appData: AppData = .init(
        icon: .init(systemSymbol: .app),
        name: .init(localized: .init("App", comment: "CodeInformation (The default app title)")),
        links: [],
        contributors: [],
        acknowledgements: [],
        versions: []
    )
    /// Whether the templates tab is active.
    var templatesActive = false
    /// The hidden standard settings tabs.
    var hidden: [StandardSettingsTab] = []
    /// The preview for a theme.
    var themesPreview: ((SchemeTheme) -> AnyView)?
    /// Extensions for the about subtab.
    var aboutView: any View = EmptyView()
    /// Extensions for the appearance subtab.
    var appearanceView: any View = EmptyView()
    /// Extensions for the shortcuts subtab.
    var shortcutsView: any View = EmptyView()
    /// Extensions for the advanced settings subtab.
    var advancedSettings: [SettingsSubtab] = []

}
