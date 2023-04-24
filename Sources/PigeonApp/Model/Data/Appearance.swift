//
//  Appearance.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SwiftUI

/// The apperance options available for the user interface.
public enum Appearance: Identifiable, CaseIterable, Codable {

    /// The light appearance.
    case light
    /// The dark appearance.
    case dark
    /// The auto appearance.
    case auto

    /// The appearance's identifier.
    public var id: String { localized.key }

    /// A localized description of the appereance.
    public var localized: LocalizedStringResource {
        switch self {
        case .light:
            return .init("Light", comment: "Appearance (Name of light appearance)")
        case .dark:
            return .init("Dark", comment: "Appearance (Name of dark appearance)")
        case .auto:
            return .init("Auto", comment: "Appearance (Name of automatic appearance)")
        }
    }

    /// The image of the appearance.
    public var image: some View {
        localized.key.packageResourceImage
    }

    /// Convert ``Appearance`` to AppKit's NSAppearance as an optional.
    public var asNSAppearance: NSAppearance? {
        switch self {
        case .light:
            return .init(named: .aqua)
        case .dark:
            return .init(named: .darkAqua)
        case .auto:
            return nil
        }
    }

}
