//
//  StandardSettingsTab.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import SettingsKit
import SFSafeSymbols
import SwiftUI

/// The default settings tabs defined in PigeonApp.
public enum StandardSettingsTab: Identifiable {

    /// The general settings tab.
    case general
    /// The behaviors settings tab.
    case behaviors
    /// The synchronization settings tab.
    case synchronization
    /// The templates settings tab.
    case templates
    /// The themes settings tab.
    case themes
    /// The updates settings tab.
    case updates
    /// The advanced settings tab.
    case advanced

    /// The identifier.
    public var id: String {
        localized.key
    }

    /// The localized title of the settings tab.
    var localized: LocalizedStringResource {
        switch self {
        case .general:
            return .init("General", comment: "StandardSettingsTab (The general settings tab)")
        case .behaviors:
            return .init("Behaviors", comment: "StandardSettingsTab (The behaviors settings tab)")
        case .synchronization:
            return .init("Synchronization", comment: "StandardSettingsTab (The synchronization settings tab)")
        case .templates:
            return .init("Templates", comment: "StandardSettingsTab (The templates settings tab)")
        case .themes:
            return .init("Themes", comment: "StandardSettingsTab (The themes settings tab)")
        case .updates:
            return .init("Updates", comment: "StandardSettingsTab (The updates settings tab)")
        case .advanced:
            return .init("Advanced", comment: "StandardSettingsTab (The advanced settings tab)")
        }
    }

    /// The symbol of the settings tab.
    var symbol: SFSymbol {
        switch self {
        case .general:
            return .gearshape
        case .behaviors:
            return .rectangleGrid1x2
        case .synchronization:
            return .arrowTriangle2Circlepath
        case .templates:
            return .docText
        case .themes:
            return .paintbrush
        case .updates:
            return .arrowTriangle2CirclepathCircle
        case .advanced:
            return .gearshape2
        }
    }

    /// The settings tab with the actions.
    var settingsTab: SettingsTab {
        switch self {
        case .templates:
            return settingsTabContent
                .standardActions {
                    PigeonModel.shared.settings.templates.append(.init(
                        title: .init(localized: .init(
                            "New Group",
                            comment: "StandardSettingsTab (Title of a new template group)"
                        )),
                        icon: .folder
                    ) { })
                } remove: { index in
                    if let index {
                        PigeonModel.shared.settings.templates.remove(at: index)
                    }
                }
        case .themes:
            return settingsTabContent
                .standardActions {
                    PigeonModel.shared.settings.themes.append(
                        .init(
                            .init(
                                localized: .init("New Theme", comment: "StandardSettingsTab (Title of a new theme)")
                            ),
                            light: Theme(),
                            dark: Theme()
                        )
                    )
                } remove: { index in
                    if let index {
                        let themes = PigeonModel.shared.settings.themes
                        let isSelected = themes[safe: index]?.id == PigeonModel.shared.settings.selectedTheme
                        if themes.count > 1 {
                            PigeonModel.shared.settings.themes.remove(at: index)
                        }
                        if isSelected, let first = PigeonModel.shared.settings.themes.first?.id {
                            PigeonModel.shared.settings.selectedTheme = first
                        }
                    }
                }
        default:
            return settingsTabContent
        }
    }

    /// The settings tab without the actions.
    var settingsTabContent: SettingsTab {
        .init(.new(title: localized.localized, icon: symbol), id: id) {
            for subtab in settingsSubtabs {
                subtab
            }
        }
    }

    /// The subtabs of a settings tab.
    @ArrayBuilder<SettingsSubtab> var settingsSubtabs: [SettingsSubtab] {
        let model = PigeonModel.shared
        let codeModel = model.pigeonCodeModel
        let appData = codeModel.information.appData
        switch self {
        case .general:
            SettingsSubtab(.new(title: LocalizedStringResource(
                "About",
                comment: "StandardSettingsTab (The general settings' about subtab)"
            ).localized, icon: .app), id: .aboutGeneralSettingsTab) {
                AboutView(appData: appData)
            }
            SettingsSubtab(
                .new(title: LocalizedStringResource(
                    "Appearance",
                    comment: "StandardSettingsTab (The general settings' appearance subtab)"
                ).localized, icon: .circleLefthalfFilled),
                id: .appearanceGeneralSettingsTab
            ) {
                AppearanceSettings()
            }
            if PigeonModel.shared.pigeonCodeModel.information.shortcutsView as? EmptyView == nil {
                SettingsSubtab(
                    .new(title: LocalizedStringResource(
                        "Keyboard Shortcuts",
                        comment: "StandardSettingsTab (The general settings' keyboard shortcuts subtab)"
                    ).localized, icon: .command),
                    id: .keyboardShortcutsGeneralSettingsTab
                ) {
                    KeyboardShortcutsSettings()
                }
            }
        case .behaviors:
            for behavior in model.behaviors {
                SettingsSubtab(.new(title: behavior.0.localized, icon: .rectangleGrid1x2), id: behavior.0.key) {
                    behavior.1
                }
            }
        case .synchronization:
            SettingsSubtab(.new(title: LocalizedStringResource(
                "Synchronization",
                comment: "StandardSettingsTab (Synchronization settings subtab)"
            ).localized, icon: .arrowTriangle2Circlepath), id: "sync") {
                SynchronizationSettings()
            }
        case .templates:
            for group in PigeonModel.shared.settings.templates {
                SettingsSubtab(.new(title: group.title, icon: group.icon), id: group.id.uuidString) {
                    TemplatesSettingsTab(group: group.binding { newValue in
                        PigeonModel.shared.settings.templates[id: group.id] = newValue
                    })
                }
            }
        case .themes:
            for theme in PigeonModel.shared.settings.themes {
                SettingsSubtab(.new(
                    title: theme.name,
                    icon: theme.id == model.settings.selectedTheme ? .checkmark : .paintbrush
                ), id: theme.id.uuidString) {
                    ThemesSettings(theme: theme.binding { newValue in
                        PigeonModel.shared.settings.themes[id: theme.id] = newValue
                    })
                }
            }
        case .updates:
            let appData = PigeonModel.shared.pigeonCodeModel.information.appData
            let newVersion: String? = {
                if let newestVersion = appData.newestVersion, newestVersion != appData.installedVersion?.tag {
                    return newestVersion
                }
                return nil
            }()
            SettingsSubtab(.new(title: LocalizedStringResource(
                "Updates",
                comment: "StandardSettingsTab (Updates subtab for checking updates)"
            ).localized, icon: .arrowTriangle2CirclepathCircle), id: .updatesSettingsTab) {
                UpdateSubtab()
            }
            for version in appData.versions {
                SettingsSubtab(.new(
                    title: version.tag,
                    icon: version.tag == appData.installedVersion?.tag ? .checkmark : .bookClosed
                ), id: version.tag) {
                    VersionView(version: version, newVersion: newVersion, downloadLink: appData.downloadLink)
                }
            }
        case .advanced:
            for subtab in PigeonModel.shared.pigeonCodeModel.information.advancedSettings {
                subtab
            }
        }
    }

}
