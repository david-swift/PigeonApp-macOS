//
//  PigeonApp.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import SettingsKit
import SwiftUI

/// A ``PigeonApp`` is a SwiftUI app with a certain organization in the settings window and menu bar.
public struct PigeonApp<Content>: Pigeon where Content: View {

    /// The ``Pigeon.ContentView`` in the ``PigeonApp`` is a type defined by the coder.
    public typealias ContentView = Content

    /// The Pigeon Model handles the data.
    @StateObject private var pigeonModel = PigeonModel.shared

    /// The content of the main window in a ``PigeonApp``.
    public var content: (Bool, Theme, [TemplateFolder]) -> Content

    /// The title of the window group.
    var title: String?

    /// The main scene of a PigeonApp.
    @SceneBuilder public var body: some Scene {
        mainWindow
            .keyboardShortcut(pigeonModel.pigeonCodeModel.information.keyboardShortcut)
            .settings(symbolVariant: pigeonModel.settings.iconFill ? .fill : .none) {
                for tab in pigeonModel.pigeonCodeModel.settings {
                    tab
                }
            }
            .commands {
                PigeonCommands()
            }
        Self.additionalScenes
    }

    /// The window group of the ``PigeonApp``.
    var mainWindow: some Scene {
        if let title {
            return WindowGroup(title) {
                mainView
            }
        } else {
            return WindowGroup {
                mainView
            }
        }
    }

    /// The main window of the ``PigeonApp``.
    @ViewBuilder var mainView: some View {
        MainWindow(content: content)
    }

    /// The public initializer with all the three views specified.
    /// - Parameters:
    ///   - appName: The app's name.
    ///   - appIcon: The app's icon.
    ///   - title: The title of the window group.
    ///   - content: The content of the main window.
    public init(
        appName: String,
        appIcon: Image,
        _ title: String? = nil,
        @ViewBuilder content: @escaping (Bool, Theme, [TemplateFolder]) -> Content
    ) {
        self.title = title
        self.content = content
        PigeonModel.shared.setSettings(information: .init(
            appData: .init(
                icon: appIcon,
                name: appName,
                links: [],
                contributors: [],
                acknowledgements: [],
                versions: []
            ),
            templatesActive: false,
            hidden: []
        ))
        Self.initAppearance()
    }

}
