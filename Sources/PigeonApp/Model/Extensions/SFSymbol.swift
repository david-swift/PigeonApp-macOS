//
//  SFSymbol.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import ColibriComponents
import Foundation
import SFSafeSymbols

extension SFSymbol: Codable, SelectionItem, Bindable {

    /// The identifier of the ``SFSymbol``.
    public var id: String {
        rawValue
    }

    /// The title of the ``SFSymbol``.
    public var title: String {
        var newWord = true
        return rawValue
            .map { character in
                if character == "." {
                    newWord = true
                    return " "
                } else if newWord {
                    newWord = false
                    return character.uppercased()
                }
                return String(character)
            }
            .joined()
    }

    /// The ``SFSymbol``.
    public var icon: SFSymbol {
        self
    }

}
