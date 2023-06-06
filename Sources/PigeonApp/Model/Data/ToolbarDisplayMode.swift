//
//  ToolbarDisplayMode.swift
//  PigeonApp
//
//  Created by david-swift on 20.02.23.
//

import ColibriComponents
import SwiftUI

/// The display mode of the elements in the toolbar.
public enum ToolbarDisplayMode: Identifiable, CaseIterable, ColibriComponents.Bindable, Codable {

    /// Show only icons.
    case iconOnly
    /// Show icons and labels.
    case iconAndText
    /// Show only labels.
    case textOnly

    /// The identifier.
    public var id: String { localized.key }

    /// A localized description of the display mode.
    public var localized: LocalizedStringResource {
        switch self {
        case .iconOnly:
            return .init("Icon Only", comment: "ToolbarDisplayMode (The name of the icon only mode)")
        case .iconAndText:
            return .init("Icon And Text", comment: "ToolbarDisplayMode (The name of the icon and text mode)")
        case .textOnly:
            return .init("Text Only", comment: "ToolbarDisplayMode (The name of the text only mode)")
        }
    }

    /// Convert ``ToolbarDisplayMode`` to AppKit's NSToolbar.DisplayMode.
    public var asNSDisplayMode: NSToolbar.DisplayMode {
        switch self {
        case .iconOnly:
            return .iconOnly
        case .iconAndText:
            return .iconAndLabel
        case .textOnly:
            return .labelOnly
        }
    }

}
