//
//  IconPickerData.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SFSafeSymbols

/// The data for an icon picker.
public struct IconPickerData {

    /// The hovered symbol.
    public var hover: SFSymbol?
    /// Stores whether the popover is presented.
    public var popoverPresented: Bool
    /// The filtered symbol as a String.
    public var symbolFilter: String {
        didSet {
            removeDots()
        }
    }
    /// The match style of the ``symbolFilter``.
    public var symbolFilterMatchStyle: KeywordsMatchStyle

    /// The initializer.
    /// It hides the popover, sets the symbol filter to an empty string
    /// and the match style to ``KeywordsMatchStyle.all``.
    init() {
        popoverPresented = false
        symbolFilter = ""
        symbolFilterMatchStyle = .all
    }

    /// Replace the dots in the ``symbolFilter`` with whitespaces.
    /// While the SFSymbols are defined with dots, this app uses spaces.
    mutating func removeDots() {
        if symbolFilterMatchStyle != .regex {
            symbolFilter = symbolFilter.map { character in
                if character == "." {
                    return " "
                } else {
                    return String(character)
                }
            }
            .joined()
        }
    }

}
