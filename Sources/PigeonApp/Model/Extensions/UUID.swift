//
//  UUID.swift
//  PigeonApp
//
//  Created by david-swift on 08.03.23.
//

import ColibriComponents
import Foundation

extension UUID: Bindable, Identifiable {

    /// The UUID's identifier.
    public var id: Self { self }

}
