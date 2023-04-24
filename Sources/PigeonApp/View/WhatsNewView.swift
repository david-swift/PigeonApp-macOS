//
//  WhatsNewView.swift
//  PigeonApp
//
//  Created by david-swift on 19.03.23.
//

import ColibriComponents
import SwiftUI

/// A view for showcasing the app's new features in a version.
struct WhatsNewView: View {

    /// The version.
    var version: Version

    /// The view's body.
    var body: some View {
        VStack {
            ForEach(version.features, id: \.title.key) { feature in
                HStack {
                    Group {
                        feature.icon
                            .font(.system(size: .featureIconFontSize))
                            .foregroundColor(feature.color)
                            .frame(width: .featureIconWidth)
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .bold()
                            Text(feature.description)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

/// Previews for the ``WhatsNewView``.
struct WhatsNewView_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        WhatsNewView(version: .init(.init(), date: .now) { })
    }

}
