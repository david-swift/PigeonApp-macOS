//
//  View.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import SwiftUI

extension View {

    /// Style a link to look like the ones used in the settings.
    /// - Returns: The view with the ``PigeonLink`` modifier applied.
    func pigeonLink() -> some View {
        modifier(PigeonLink())
    }

}
