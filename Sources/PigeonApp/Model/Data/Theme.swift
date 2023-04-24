//
//  Theme.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SwiftUI

/// A theme for a pigeon app.
public struct Theme: Codable {

    /// The primary accent color.
    public var primaryAccent: Color = .accentColor
    /// The secondary accent color.
    public var secondaryAccent: Color = .red
    /// The tertiary accent color.
    public var tertiaryAccent: Color = .green
    /// The quaternary accent color.
    public var quaternaryAccent: Color = .blue
    /// The quinary accent color.
    public var quinaryAccent: Color = .purple
    /// The background color.
    public var background = Color(nsColor: .windowBackgroundColor)

}
