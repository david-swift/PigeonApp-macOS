//
//  PigeonAppAction.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SettingsKit
import SwiftUI

/// Useful actions for interacting with AppKit.
public enum PigeonAppAction {

    /// Errors for the ``PigeonAppAction``.
    enum PigeonAppActionError: Error {

        /// There is no window with a customizable toolbar available.
        case noToolbarWindowAvailable

    }

    /// Set the app's theme to light, dark or automatic.
    /// - Parameter appearance: The new theme.
    public static func setAppearance(_ appearance: Appearance) {
        Task {
            await MainActor.run {
                NSApplication.shared.appearance = appearance.asNSAppearance
            }
        }
    }

    /// Set the toolbar style of all the window except the defined exceptions.
    /// - Parameters:
    ///     - displayMode: The display mode of the toolbars.
    ///     - style: The toolbar style.
    ///     - exceptionIDs: The exception window identifiers.. By default, the settings window is ignored.
    public static func setToolbarStyle(
        displayMode: ToolbarDisplayMode,
        style: ToolbarStyle,
        exceptionIDs: [String?] = [.settingsWindowIdentifier]
    ) {
        for (index, window) in NSApplication.shared.windows.enumerated() {
            if let id = window.identifier?.rawValue, !exceptionIDs.contains(id) {
                NSApplication.shared.windows[safe: index]?.toolbar?.displayMode = displayMode.asNSDisplayMode
                NSApplication.shared.windows[safe: index]?.toolbarStyle = style.asNSToolbarStyle
            }
        }
    }

    /// Open the customization sheet for the toolbar.
    /// - Parameter exceptionIDs: The exception window identifiers..
    public static func customizeToolbar(exceptionIDs: [String?] = []) throws {
        for window in NSApplication.shared.windows {
            let id = getKeyWindowID()
            if !exceptionIDs.contains(id) {
                window.toolbar?.runCustomizationPalette(nil)
                if getKeyWindowID() != id {
                    return
                }
            }
        }
        throw PigeonAppActionError.noToolbarWindowAvailable
    }

    /// Toggle the visibility of the toolbar in the windows.
    /// - Parameters:
    ///   - bool: If true, the toolbars are hidden, else, they are visible.
    ///   - exceptionIDs: The exception window identifiers. By default, the settings window is ignored.
    public static func toggleToolbarHidden(_ bool: Bool, exceptionIDs: [String?] = [.settingsWindowIdentifier]) {
        for window in NSApplication.shared.windows {
            if window.toolbar?.isVisible == bool && !exceptionIDs.contains(window.identifier?.rawValue) {
                window.toggleToolbarShown(nil)
            }
        }
    }

    /// Get the identifier of the key window.
    /// - Returns: The key window's identifier as an optional string.
    public static func getKeyWindowID() -> String? {
        NSApplication.shared.keyWindow?.identifier?.rawValue
    }

    /// Add a template to a folder.
    /// - Parameters:
    ///   - template: The template.
    ///   - id: The folder's id.
    public static func add(_ template: Template, to id: UUID) {
        PigeonModel.shared.settings.templates[id: id]?.templates.append(template)
    }

    /// Add a template folder.
    /// - Parameter folder: The template folder
    public static func add(_ folder: TemplateFolder) {
        PigeonModel.shared.settings.templates.append(folder)
    }

}
