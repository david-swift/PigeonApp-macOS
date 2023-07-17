//
//  PigeonDocumentApp.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import SwiftUI

/// A PigeonDocumentApp is a SwiftUI app with a certain organization in the settings window and menu bar.
/// It is basically a PigeonApp but using SwiftUI.DocumentGroup instead of SwiftUI.WindowGroup.
public struct PigeonDocumentApp<Document, Content>: Pigeon
where Document: FileDocument, Content: View {

    /// The ``Pigeon.ContentView`` in the ``PigeonDocumentApp`` is a type defined by the coder.
    public typealias ContentView = Content

    /// The Pigeon Model handles the data.
    @StateObject private var pigeonModel = PigeonModel.shared

    /// The document that is created when the user taps the "New" button.
    var newDocument: Document
    /// The content of the main window in a ``PigeonDocumentApp``.
    public var content: (Binding<Document>, Bool, Theme, [TemplateFolder]) -> Content

    /// The main scene of a PigeonDocumentApp.
    public var body: some Scene {
        DocumentGroup(newDocument: newDocument) { file in
            MainWindow(
                content: view(content, document: file.$document)
            )
        }
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

    /// The public initializer with all the three views specified.
    /// - Parameters:
    ///   - appName: The app's name.
    ///   - appIcon: The app's icon.
    ///   - document: The document that is created when the user taps the "New" button.
    ///   - content: The content of the main window in a ``PigeonDocumentApp``.
    public init(
        appName: String,
        appIcon: Image,
        document: Document,
        @ViewBuilder content: @escaping (Binding<Document>, Bool, Theme, [TemplateFolder]) -> Content
    ) {
        self.newDocument = document
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
            templatesActive: false
        ))
        Self.initAppearance()
    }

    /// Fill in the document in al view function.
    /// - Parameters:
    ///   - view: The view function.
    ///   - document: The document to fill in.
    /// - Returns: The view function without the document parameter.
    private func view<T>(
        _ view: @escaping (Binding<Document>, Bool, Theme, [TemplateFolder]) -> T,
        document: Binding<Document>
    ) -> (Bool, Theme, [TemplateFolder]) -> T where T: View {
        { iconFill, theme, templates in
            view(document, iconFill, theme, templates)
        }
    }

}
