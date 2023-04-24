//
//  KeywordsMatchStyle.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import Foundation

/// Defines which elements in a search match:
/// Elements that contain all the search elements,
/// elements that contain one or more of the search elements
/// or the search is done with regular expressions.
public enum KeywordsMatchStyle {

    /// Matches elements that contain all the search elements.
    case all
    /// Matches elements that contain at least one of the search elements.
    case one
    /// Matches elements that match the regular expression.
    case regex

    /// The localized name of the match style.
    public var localized: LocalizedStringResource {
        switch self {
        case .all:
            return .init("All Keywords", comment: "KeywordsMatchStyle (The name of the \"All Keywords\" match style)")
        case .one:
            return .init("One Keyword", comment: "KeywordsMatchStyle (The name of the \"One Keyword\" match style)")
        case .regex:
            return .init("Regex", comment: "KeywordsMatchStyle (The name of the \"Regex\" match style)")
        }
    }

}
