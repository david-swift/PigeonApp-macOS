//
//  AppData.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import SwiftUI

/// Information about an app.
public struct AppData {

    /// The app icon.
    public var icon: Image
    /// The app's name.
    public var name: String
    /// The app's description.
    public var description: String?
    /// Important links without the link to the documentation.
    public var links: [(String, URL)]
    /// The contributors.
    public var contributors: [(String, URL)]
    /// The acknowledgements.
    public var acknowledgements: [(String, URL)]
    /// The app's versions.
    public var versions: [Version]
    /// The newest available Version.
    public var newestVersion: String?
    /// The link for downloading the newest available version.
    public var downloadLink: URL?
    /// The link to the documentation.
    public var help: (String, URL)?
    /// The name of the table in Supabase.
    public var supabaseTable: String = .init()

    /// The installed version of the app.
    public var installedVersion: Version? {
        versions.first
    }

    /// Whether the information in Settings > About is visible.
    public var showInformation: Bool {
        !(description == nil && links.isEmpty && contributors.isEmpty && acknowledgements.isEmpty)
    }

}
