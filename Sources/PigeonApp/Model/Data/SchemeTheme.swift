//
//  SchemeTheme.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ColibriComponents
import Foundation
import SwiftUI

/// A theme containing a light and a dark theme.
public struct SchemeTheme: Identifiable, Codable, Bindable {

    /// The identifier.
    public var id: UUID
    /// The theme's name.
    public var name: String
    /// The light theme.
    public var light: Theme
    /// The dark theme.
    public var dark: Theme

    /// The ``SchemeTheme``'s initializer.
    /// - Parameters:
    ///   - name: The theme's name.
    ///   - light: The light theme.
    ///   - dark: The dark theme.
    init(_ name: String, light: Theme, dark: Theme) {
        id = .init()
        self.name = name
        self.light = light
        self.dark = dark
    }

    /// Get the active theme based on the color scheme.
    /// - Parameter scheme: The color scheme (light or dark mode).
    /// - Returns: The theme.
    public func activeTheme(scheme: ColorScheme) -> Theme {
        scheme == .dark ? dark : light
    }

}
