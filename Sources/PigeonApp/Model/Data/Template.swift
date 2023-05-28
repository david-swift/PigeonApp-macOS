//
//  Template.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ColibriComponents
import SFSafeSymbols
import SwiftUI

/// A template.
public struct Template: Identifiable, Codable, SelectionItem {

    /// The template's identifier.
    public let id: UUID
    /// The template's title.
    public var title: String
    /// The template's icon.
    public var icon: SFSymbol
    /// Content of the template.
    public var content: Data

    /// Initialize a new template.
    /// - Parameters:
    ///   - title: The template's title.
    ///   - icon: The template's icon.
    ///   - content: The content of the template.
    public init(title: String, icon: SFSymbol, content: Data) {
        id = .init()
        self.title = title
        self.icon = icon
        self.content = content
    }

}
