//
//  MainWindow.swift
//  PigeonApp
//
//  Created by david-swift on 07.02.23.
//

import SwiftUI

/// The content of the main window in a ``PigeonApp`` and ``PigeonDocumentApp``.
struct MainWindow<Content>: View where Content: View {

    /// An instance of ``PigeonModel``.
    /// It stores values that are the same in the whole app.
    @StateObject private var model = PigeonModel.shared
    /// The active color scheme.
    @Environment(\.colorScheme)
    private var colorScheme
    /// Open a window.
    @Environment(\.openWindow)
    private var openWindow
    /// The content bar of this window, or nil if there is no content bar.
    var content: (Bool, Theme, [TemplateFolder]) -> Content

    /// The view's body.
    var body: some View {
        content(iconFill, theme, templates)
            .symbolVariant(model.settings.iconFill ? .fill : .none)
            .task { @MainActor in
                PigeonAppAction.setToolbarStyle(
                    displayMode: PigeonModel.shared.settings.toolbarDisplayMode,
                    style: PigeonModel.shared.settings.toolbarStyle
                )
                let reminder = {
                    if let lastReminder = PigeonModel.shared.settings.lastUpdateReminder {
                        let oneDay: Double = 90_000
                        return Date.now.timeIntervalSince(lastReminder) > oneDay
                    }
                    return true
                }()
                if model.pigeonCodeModel.information.appData.newestVersion != nil
                    && model.pigeonCodeModel.information.appData.downloadLink != nil
                    && reminder {
                    openWindow(id: .updatesSettingsTab)
                    PigeonModel.shared.settings.lastUpdateReminder = .now
                }
            }
    }

    /// Whether the icons are filled.
    private var iconFill: Bool {
        model.settings.iconFill
    }

    /// The active theme.
    private var theme: Theme {
        if let schemeTheme = model.settings.themes[id: model.settings.selectedTheme] {
            return SchemeTheme.activeTheme(schemeTheme)(scheme: colorScheme)
        } else {
            return .init()
        }
    }

    /// The templates.
    private var templates: [TemplateFolder] {
        model.settings.templates
    }

}
