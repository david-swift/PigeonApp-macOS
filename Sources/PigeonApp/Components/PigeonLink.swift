//
//  PigeonLink.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import SwiftUI

/// The style of a link.
struct PigeonLink: ViewModifier {

    /// Whether the link is hovered.
    @State private var hover = false

    /// The modifier's body.
    /// - Parameter content: The modifier's content.
    /// - Returns: A view containing the content in the style of a link.
    func body(content: Content) -> some View {
        content
            .padding(.pigeonLinkPadding)
            .padding(.horizontal, .pigeonLinkPadding)
            .background(
                .blue.opacity(hover ? .pigeonLinkBackgroundOpacity : 0),
                in: RoundedRectangle(cornerRadius: .pigeonLinkBackgroundCornerRadius)
            )
            .animation(.default, value: hover)
            .onHover { hover = $0 }
    }

}
