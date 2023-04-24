//
//  ToolbarStyle.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SwiftUI

/// The style of the toolbar.
public enum ToolbarStyle: Identifiable, CaseIterable, Codable {

    /// The unified toolbar style.
    case unified
    /// The compact version of the unified toolbar style.
    case unifiedCompact
    /// The expanded toolbar style.
    case expanded

    /// The identifier.
    public var id: String { localized.key }

    /// A localized description of the toolbar style.
    public var localized: LocalizedStringResource {
        switch self {
        case .unified:
            return .init("Unified", comment: "ToolbarStyle (The name of the unified style)")
        case .unifiedCompact:
            return .init("Unified Compact", comment: "ToolbarStyle (The name of the unified compact style)")
        case .expanded:
            return .init("Expanded", comment: "ToolbarStyle (The name of the expanded style)")
        }
    }

    /// The image of the toolbar style.
    public var image: some View {
        localized.key.packageResourceImage
    }

    /// Convert ``ToolbarStyle`` to AppKit's NSWindow.ToolbarStyle.
    public var asNSToolbarStyle: NSWindow.ToolbarStyle {
        switch self {
        case .unified:
            return .unified
        case .unifiedCompact:
            return .unifiedCompact
        case .expanded:
            return .expanded
        }
    }

}
