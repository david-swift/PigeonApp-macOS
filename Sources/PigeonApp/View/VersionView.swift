//
//  VersionView.swift
//  PigeonApp
//
//  Created by david-swift on 19.03.23.
//

import SwiftUI

/// Information about a version in the version settings tab.
struct VersionView: View {

    /// The version to show information about.
    var version: Version
    /// If there is a new uninstalled version available, this is the version number.
    var newVersion: String?
    /// If there is a new uninstalled version available, this is the download link.
    var downloadLink: URL?

    /// The view's body.
    var body: some View {
        GeneralSettingsView(
            text: .init("What's New?", comment: "VersionView (Button for showing a list of the changes)")
        ) {
            VStack(alignment: .center) {
                Text(.init("Version **\(version.tag)**", comment: "VersionView (Title of the overview)"))
                    .font(.largeTitle)
                    .padding(.bottom, .titlePadding)
                Text(version.date, style: .date)
                    .foregroundColor(.secondary)
            }
        } content: {
            WhatsNewView(version: version)
            if let download = version.download {
                HStack {
                    Spacer()
                    Link(String(localized: .init(
                        "Download Version \(version.tag)",
                        comment: "VersionView (Title of the link for a version's download)"
                    )), destination: download)
                        .pigeonLink()
                }
            }
        }
        .textSelection(.enabled)
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            if let newVersion, let downloadLink {
                HStack {
                    Spacer()
                    Text(.init(
                        "Version **\(newVersion)** is available!",
                        comment: "VersionView (Title of update banner)"
                    ))
                    Link(String(localized: .init(
                        "Download",
                        comment: "VersionView (Link for downloading the new version)"
                    )), destination: downloadLink)
                        .pigeonLink()
                    Spacer()
                }
                .padding()
                .background(.blue.opacity(.newestVersionBackgroundOpacity))
                .background(.background)
                .shadow(color: .black.opacity(.newestVersionShadowOpacity), radius: .newestVersionShadowRadius)
            }
        }
    }

}

/// The previews for ``VersionView``.
struct VersionView_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        VersionView(version: .init("0.1.0", date: .now) { })
    }

}
