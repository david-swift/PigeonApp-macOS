//
//  AboutView.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import SwiftUI

/// A view showing information about the app.
struct AboutView: View {

    /// Information about the app.
    var appData: AppData

    /// The view's body.
    var body: some View {
        GeneralSettingsView(
            text: appData.showInformation ? .init(
                "More Information",
                comment: "AboutView (The button for displaying more information)"
            ) : nil
        ) {
            overview
        } content: {
            information
        }
        .textSelection(.enabled)
    }

    /// General information about the app.
    @ViewBuilder var overview: some View {
        appData.icon
            .resizable()
            .frame(width: .appIconSideLength, height: .appIconSideLength)
        Text(appData.name)
            .font(.largeTitle)
            .bold()
            .padding(.bottom, .titlePadding)
        if let version = appData.installedVersion?.tag {
            Text(.init("Version \(version)", comment: "AboutView (The app's version)"))
                .foregroundColor(.secondary)
        }
    }

    /// More detailed information about the app.
    @ViewBuilder var information: some View {
        description
        links
        contributors
        acknowledgements
        AnyView(PigeonModel.shared.pigeonCodeModel.information.aboutView)
    }

    /// A short description of the app's function.
    @ViewBuilder var description: some View {
        if let description = appData.description {
            HStack {
                Spacer()
                Text(description)
                Spacer()
            }
        }
    }

    /// Links to websites related to the app.
    @ViewBuilder var links: some View {
        if !appData.links.isEmpty || appData.help != nil {
            HStack {
                Spacer()
                let links = { () -> [(String, URL)] in
                    var links = appData.links
                    if let help = appData.help {
                        links.insert(help, at: 0)
                    }
                    return links
                }()
                ForEach(links, id: \.0) { link in
                    Link(destination: link.1) {
                        Text(link.0)
                            .lineLimit(1)
                            .pigeonLink()
                    }
                    if links.last?.0 != link.0 {
                        Divider()
                    }
                }
                Spacer()
            }
        }
    }

    /// A list of the app's contributors.
    @ViewBuilder var contributors: some View {
        if !appData.contributors.isEmpty {
            Section(.init("Contributors", comment: "AboutView (Title of the contributors section)")) {
                ForEach(appData.contributors, id: \.0) { contributor in
                    HStack {
                        AsyncImage(
                            url: URL(string: "\(imageURL(link: contributor.1)).png")
                        ) { image in
                            image.resizable()
                                .resizable()
                                .cornerRadius(.infinity)
                                .frame(width: .profilePictureSideLength, height: .profilePictureSideLength)
                        } placeholder: {
                            ProgressView()
                        }
                        Link(destination: contributor.1) {
                            Text(contributor.0)
                                .lineLimit(1)
                                .pigeonLink()
                            Spacer()
                            Image(systemSymbol: .link)
                                .pigeonLink()
                                .accessibilityLabel(
                                    .init(
                                        "Link to \(contributor.0)",
                                        comment: "AboutView (Accessibility label of link to contributor)"
                                    )
                                )
                        }
                    }
                }
            }
        }
    }

    /// A list of packages used in the app and other acknowledgements.
    @ViewBuilder var acknowledgements: some View {
        if !appData.acknowledgements.isEmpty {
            Section(.init("Acknowledgements", comment: "AboutView (Title of the acknowledgements section)") ) {
                ForEach(appData.acknowledgements, id: \.0) { element in
                    Link(destination: element.1) {
                        Text(element.0)
                            .pigeonLink()
                        Spacer()
                        Image(systemSymbol: .link)
                            .pigeonLink()
                            .accessibilityLabel(.init(
                                "Link to \(element.0)",
                                comment: "AboutView (Accessibility label of link to acknowledgement)"
                            ))
                    }
                }
            }
        }
    }

    /// Get the URL to the contributor's image from the URL to their GitHub account.
    /// - Parameter link: The URL to their GitHub account.
    /// - Returns: The URL to the image as a string.
    private func imageURL(link: URL) -> String {
        var imageURL = link.absoluteString
        if imageURL.last == "/" {
            imageURL.removeLast()
        }
        return imageURL
    }

}

/// Preview for the ``AboutView``.
struct AboutView_Previews: PreviewProvider {

    /// The previews.
    static var previews: some View {
        AboutView(
            appData: .init(
                icon: .init(systemSymbol: .app),
                name: "Hi",
                links: [],
                contributors: [],
                acknowledgements: [],
                versions: [.init("0.1.0", date: .now) { }]
            )
        )
    }

}
