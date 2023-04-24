//
//  URL.swift
//  PigeonApp
//
//  Created by david-swift on 20.04.23.
//
//  swiftlint:disable force_unwrapping

import Foundation

extension URL {

    /// Get the URL from a string. Use this function **only** when you are sure that the string is a valid URL.
    /// - Parameter url: The URL as a string.
    /// - Returns: The URL.
    public static func string(_ url: String) -> Self {
        .init(string: url)!
    }

}

//  swiftlint:enable force_unwrapping
