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

    /// Additional scenes (next to the main window and settings scene) in a PigeonApp.
    @SceneBuilder static var additionalScenes: some Scene {
        settingsTabWindow(title: .init(
            "About",
            comment: "Pigeon (Title of the About window)"
        ), id: .aboutGeneralSettingsTab) {
            AboutView(appData: PigeonModel.shared.pigeonCodeModel.information.appData)
        }
        settingsTabWindow(title: .init(
            "Update",
            comment: "Pigeon (Title of the Update window)"
        ), id: .updatesSettingsTab) {
            UpdateSubtab()
        }
    }

    /// A window showing a snippet from the settings window.
    /// - Parameters:
    ///   - title: The window's title.
    ///   - id: The window's identifier.
    ///   - content: The content of the window.
    /// - Returns: The window scene.
    @SceneBuilder
    private static func settingsTabWindow<Content>(
        title: LocalizedStringResource,
        id: String,
        @ViewBuilder content: () -> Content
    ) -> some Scene where Content: View {
        let width = 400.0
        let height = 470.0
        Window(String(localized: title), id: id) {
            content()
                .task { @MainActor in
                    NSApp.keyWindow?.standardWindowButton(.zoomButton)?.isHidden = true
                    NSApp.keyWindow?.standardWindowButton(.miniaturizeButton)?.isHidden = true
                    NSApp.keyWindow?.isMovableByWindowBackground = true
                }
        }
        .windowStyle(.hiddenTitleBar)
        .defaultSize(width: width, height: height)
        .commandsRemoved()
    }

    /// Initialize the appearance on startup.
    static func initAppearance() {
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: 1)
            PigeonAppAction.setAppearance(PigeonModel.shared.settings.appearance)
            PigeonModel.shared.setSettings(information: PigeonModel.shared.pigeonCodeModel.information)
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
                Task { @MainActor in
                    if let newValue = try? JSONDecoder().decode(Data.self, from: newValue) {
                        data.wrappedValue = newValue
                    }
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
                if version.0 != PigeonModel.shared.pigeonCodeModel.information.appData.installedVersion?.tag {
                    editInformation { information in
                        information.appData.newestVersion = version.0
                        information.appData.downloadLink = version.1
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
