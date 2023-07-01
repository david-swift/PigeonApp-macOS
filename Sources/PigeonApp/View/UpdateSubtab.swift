//
//  UpdateSubtab.swift
//  PigeonApp
//
//  Created by david-swift on 01.07.2023.
//

import SwiftUI

/// The view showing update information (settings and "Update" window).
struct UpdateSubtab: View {

    /// The view's body
    var body: some View {
        if let newVersion = PigeonModel.shared.pigeonCodeModel.information.appData.newestVersion,
           let link = PigeonModel.shared.pigeonCodeModel.information.appData.downloadLink {
            VStack(alignment: .center) {
                Text(
                    .init(
                        "Version \(newVersion) is available.",
                        comment: "StandardSettingsTab (Description of the newest version)"
                    )
                )
                Link(String(localized: .init(
                    "Download",
                    comment: "StandardSettingsTab (Link for downloading the newest version)"
                )), destination: link)
                    .pigeonLink()
            }
        } else {
            Text(.init(
                "You're up-to-date!",
                comment: "StandardSettingsTab (A message showing that no update is available)"
            ))
        }
    }

}
