//
//  PigeonModel.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import Foundation
import SwiftUI

/// This class manages the data used in the default settings and menu bar.
public class PigeonModel: ObservableObject {

    /// A shared instance of the ``PigeonModel``.
    static var shared = PigeonModel()

    /// The data used for customizing the user experience.
    @Published public var settings: PigeonSettingsData {
        didSet {
            set()
            let data = try? JSONEncoder().encode(settings)
            if let data {
                UserDefaults.standard.set(data, forKey: .settingsData)
            }
        }
    }
    /// Data defined by the coder.
    @Published public var pigeonCodeModel: PigeonCodeModel
    /// The behaviors.
    @Published var behaviors: [(LocalizedStringResource, FunctionEditor)]

    /// The initializer of a ``PigeonModel``.
    /// - Parameters:
    ///   - information: Information defined by the coder.
    ///   - templates: The template groups.
    init(information: CodeInformation = .init(), templates: [TemplateFolder] = []) {
        settings = .init(templates: templates)
        if let data = UserDefaults.standard.data(forKey: .settingsData),
            let decoded = try? JSONDecoder().decode(PigeonSettingsData.self, from: data) {
            settings = decoded
        }
        pigeonCodeModel = .init(information: information)
        behaviors = []
        set()
    }

    /// Set the settings.
    /// - Parameter information: The code information.
    func setSettings(information: CodeInformation) {
        pigeonCodeModel.setSettings(information: information)
    }

    /// Set the appearance and the toolbar style.
    func set() {
        PigeonAppAction.setAppearance(settings.appearance)
        PigeonAppAction.setToolbarStyle(
            displayMode: settings.toolbarDisplayMode,
            style: settings.toolbarStyle
        )
    }

}
