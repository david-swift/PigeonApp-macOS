//
//  Pigeon.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import SettingsKit
import SwiftUI

/// A interface to which ``PigeonApp`` and ``PigeonDocumentApp`` conform to.
public protocol Pigeon: Scene {

    /// The type of the content. view.
    associatedtype ContentView: View

}

extension Pigeon {

    /// The behavior type.
    typealias Behavior = (LocalizedStringResource, FunctionEditor)

    /// Add a shortcut to a settings tab.
    /// - Parameter tab: The settings tab without the shortcut.
    /// - Returns: The settings tab with the shortcut.
    static func shortcut(tab: SettingsTab) -> SettingsTab {
        var tab = tab
        for subtab in tab.content where subtab.id == PigeonModel.shared.settings.standardSettingsSubtab {
            tab.content[id: subtab.id] = subtab.shortcut()
        }
        return tab
    }

    /// Initialize the appearance on startup.
    static func initAppearance() {
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 1)
            PigeonAppAction.setAppearance(PigeonModel.shared.settings.appearance)
            PigeonModel.shared.setSettings(information: PigeonModel.shared.pigeonCodeModel.information)
            await MainActor.run {
                let installedVersion = PigeonModel.shared.pigeonCodeModel.information.appData.installedVersion
                if PigeonModel.shared.settings.versionOverview
                    != installedVersion?.tag {
                    SettingsAction.showSettings(
                        tab: StandardSettingsTab.updates.id,
                        subtab: installedVersion?.tag ?? .init()
                    )
                    PigeonModel.shared.settings.versionOverview = installedVersion?.tag
                }
            }
        }
    }

    /// Add details about your app.
    /// - Parameters:
    ///   - description: Add a description.
    ///   - links: Add important links such as a website or a repository.
    ///   - contributors: The people that contributed to the app and links to their GitHub account.
    ///   - acknowledgements: Links to packages used in the app and other acknowledgements.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func information(
        description: String,
        @ArrayBuilder<(String, URL)> links: () -> [(String, URL)],
        @ArrayBuilder<(String, URL)> contributors: () -> [(String, URL)],
        @ArrayBuilder<(String, URL)> acknowledgements: () -> [(String, URL)]
    ) -> Self {
        editInformation { information in
            information.appData.description = description
            information.appData.links = links()
            information.appData.contributors = contributors()
            information.appData.acknowledgements = acknowledgements()
        }
    }

    /// Set the help link.
    /// - Parameters:
    ///   - label: The help link's label.
    ///   - link: The help link.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func help(_ label: LocalizedStringResource, link: URL) -> Self {
        editInformation { information in
            information.appData.help = (String(localized: label), link)
        }
    }

    /// Add data that can be stored in a Supabase repository.
    /// Do also save the data locally.
    /// - Parameters:
    ///   - data: The data to store in the database and update with the database.
    ///   - table: The Supabase table's name.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func supabase<Data>(data: Binding<Data>, table: String) -> Self where Data: Codable {
        Task { @MainActor in
            PigeonModel.shared.supabaseData = try? JSONEncoder().encode(data.wrappedValue)
            PigeonModel.shared.updateSupabaseData = { newValue in
                if let newValue = try? JSONDecoder().decode(Data.self, from: newValue) {
                    data.wrappedValue = newValue
                }
            }
        }
        let newSelf = editInformation { information in
            information.appData.supabaseTable = table
        }
        return newSelf
    }

    /// Add custom settings tabs.
    /// - Parameter settings: The settings tabs to add.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func pigeonSettings(@ArrayBuilder<SettingsTab> _ settings: () -> [SettingsTab]) -> Self {
        editInformation { information in
            information.tabs += settings()
        }
    }

    /// Specify the default templates and activate the templates settings tab.
    /// - Parameter _:  The default templates.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func templates(@ArrayBuilder<TemplateFolder> _ templates: () -> [TemplateFolder]) -> Self {
        editInformation { information in
            information.templatesActive = true
            if PigeonModel.shared.settings.templates.isEmpty {
                PigeonModel.shared.settings.templates = templates()
            }
        }
    }

    /// Add a preview for the themes and activate the themes settings tab.
    /// - Parameter preview: The preivew for the themes.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func themes<ThemesView>(
        @ViewBuilder preview: @escaping (SchemeTheme) -> ThemesView
    ) -> Self where ThemesView: View {
        editInformation { information in
            information.themesPreview = { scheme in
                AnyView(preview(scheme))
            }
        }
    }

    /// The app's version history.
    /// - Parameter versions: The versions. The first version is the newest, the last the oldest.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func versions(@ArrayBuilder<Version> versions: () -> [Version]) -> Self {
        editInformation { information in
            information.appData.versions = versions()
        }
    }

    /// Set the latest app version.
    /// - Parameter version: The tag of the newest available version and the link for downloading it.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func newestVersion(_ version: @escaping () async throws -> (String, URL)) -> Self {
        Task { @MainActor in
            if let version = try? await version() {
                editInformation { information in
                    information.appData.newestVersion = version.0
                    information.appData.downloadLink = version.1
                    let reminder = {
                        if let lastReminder = PigeonModel.shared.settings.lastUpdateReminder {
                            let twoDays: Double = 175_000
                            return Date.now.timeIntervalSince(lastReminder) > twoDays
                        }
                        return true
                    }()
                    if information.appData.newestVersion != information.appData.versions[safe: 0]?.tag && reminder {
                        SettingsAction.showSettings(tab: StandardSettingsTab.updates.id, subtab: .updatesSettingsTab)
                        PigeonModel.shared.settings.lastUpdateReminder = .now
                    }
                }
            }
        }
        return self
    }

    /// Get the latest app version from GitHub releases.
    /// - Parameters:
    ///   - gitHubUser: The owner of the repository.
    ///   - gitHubRepo: The repository.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func newestVersion(gitHubUser: String, gitHubRepo: String) -> Self {
        newestVersion {
            let string = "https://api.github.com/repos/\(gitHubUser)/\(gitHubRepo)/releases/latest"
            let regex = #/"name":"(?<name>.*?)"/#
            guard let url = URL(string: string) else { throw URLError(.badURL) }
            guard let json = try await url.lines.first(where: { _ in true }) else { throw URLError(.badURL) }
            guard let result = try regex.firstMatch(in: .init(json)) else { throw URLError(.badURL) }
            let tag = String(result.output.name)
            let download = "https://github.com/\(gitHubUser)/\(gitHubRepo)/releases/tag/\(tag)"
            guard let downloadURL = URL(string: download) else { throw URLError(.badURL) }
            return (tag, downloadURL)
        }
    }

    /// Remove a standard settings tab.
    /// - Parameter tab: The settings tab to hide.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func hide(tab: StandardSettingsTab) -> Self {
        editInformation { information in
            information.hidden.append(tab)
        }
    }

    /// Add content to the about subtab in the general settings.
    /// - Parameter content: The content addition.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func extendAboutView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View {
        editInformation { information in
            information.aboutView = content()
        }
    }

    /// Add content to the appearance subtab in the general settings.
    /// - Parameter content: The content addition.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func extendAppearanceView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View {
        editInformation { information in
            information.appearanceView = content()
        }
    }

    /// Add content to the keyboard shortcuts subtab in the general settings.
    /// - Parameter content: The content addition.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func extendShortcutsView<Content>(@ViewBuilder content: () -> Content) -> Self where Content: View {
        editInformation { information in
            information.shortcutsView = content()
        }
    }

    /// Add subtabs to the advanced settings tab.
    /// - Parameter _:  The settings subtabs.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    public func advancedSettings(@ArrayBuilder<SettingsSubtab> _ advancedSettings: () -> [SettingsSubtab]) -> Self {
        editInformation { information in
            information.advancedSettings = advancedSettings()
        }
    }

    /// Add the settings tab for editing the app's behaviors.
    /// - Parameter behaviors: The app's behaviors editors.
    public func behaviors(
        @ArrayBuilder<Behavior> behaviors: @escaping () -> [(LocalizedStringResource, FunctionEditor)]
    ) -> Self {
        Task { @MainActor in
            PigeonModel.shared.behaviors = behaviors()
        }
        return self
    }

    /// Edit information about the app.
    /// - Parameter edit: The edit.
    /// - Returns: The ``PigeonApp`` or ``PigeonDocumentApp``.
    @discardableResult
    private func editInformation(edit: (inout CodeInformation) -> Void) -> Self {
        var information = PigeonModel.shared.pigeonCodeModel.information
        edit(&information)
        PigeonModel.shared.setSettings(information: information)
        return self
    }

}
