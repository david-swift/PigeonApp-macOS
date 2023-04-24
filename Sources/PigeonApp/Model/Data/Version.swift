//
//  Version.swift
//  PigeonApp
//
//  Created by david-swift on 19.03.23.
//

import ColibriComponents
import SFSafeSymbols
import SwiftUI

/// A version of the app.
public struct Version {

    /// The version's tag.
    var tag: String
    /// The release date.
    var date: Date
    /// The new features.
    var features: [Feature]
    /// The download link.
    var download: URL?

    /// The version's initializer.
    /// - Parameters:
    ///   - tag: The version's tag.
    ///   - date: The release date.
    ///   - download: The download link.
    ///   - features: The new features.
    public init(_ tag: String, date: Date, download: URL? = nil, @ArrayBuilder<Feature> features: () -> [Feature]) {
        self.tag = tag
        self.date = date
        self.features = features()
        self.download = download
    }

    /// A description of a new feature in a version.
    public struct Feature {

        /// The feature's icon.
        var icon: Image
        /// The icon's color.
        var color: Color
        /// The feature's title.
        var title: LocalizedStringResource
        /// A description of the feature.
        var description: LocalizedStringResource

        /// The feature's initializer.
        /// - Parameters:
        ///   - title: The feature's title.
        ///   - description: A description of the feature.
        ///   - icon: The feature's icon.
        ///   - color: The icon's color.
        public init(
            _ title: LocalizedStringResource,
            description: LocalizedStringResource,
            icon: Image,
            color: Color = .accentColor
        ) {
            self.icon = icon
            self.color = color
            self.title = title
            self.description = description
        }

        /// The feature's initializer with a system symbol.
        /// - Parameters:
        ///   - title: The feature's title.
        ///   - description: A description of the feature.
        ///   - icon: The feature's icon.
        ///   - color: The icon's color.
        public init(
            _ title: LocalizedStringResource,
            description: LocalizedStringResource,
            icon: SFSymbol,
            color: Color = .accentColor
        ) {
            self.icon = .init(systemSymbol: icon)
            self.color = color
            self.title = title
            self.description = description
        }

    }

}
