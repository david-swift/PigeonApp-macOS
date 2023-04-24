//
//  TemplateFolder.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import ColibriComponents
import Foundation
import SFSafeSymbols

/// A folder of templates.
public struct TemplateFolder: Codable, Bindable, Identifiable {

    /// The folder's identifier.
    public let id: UUID
    /// The folder's title.
    public var title: String
    /// The folder's icon.
    var icon: SFSymbol
    /// The templates.
    var templates: [Template]

    /// The template folder as a ``Folder``.
    var folder: Folder<Template> {
        .init(
            title,
            icon: .init(systemSymbol: icon),
            content: {
                for template in templates {
                    template
                }
            },
            id: id
        )
    }

    /// Initialize a ``TemplateFolder``.
    /// - Parameters:
    ///   - title: The template folder's title.
    ///   - icon: The template folder's icon.
    ///   - templates: The content.
    public init(title: String, icon: SFSymbol, @ArrayBuilder<Template> templates: () -> [Template]) {
        self.id = .init()
        self.title = title
        self.icon = icon
        self.templates = templates()
    }

}
