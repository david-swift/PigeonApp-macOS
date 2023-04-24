//
//  GeneralSettingsView.swift
//  PigeonApp
//
//  Created by david-swift on 20.02.23.
//

import SwiftUI

/// The content of a settings subtab with a preview image and the controls.
public struct GeneralSettingsView<Overview, Content>: View where Overview: View, Content: View {

    /// Whether scrolling is enabled in the current state.
    @State private var scrollDisabled = true
    /// The overview image.
    var overview: Overview
    /// The scroll text.
    var scrollText: LocalizedStringResource?
    /// The controls.
    var content: Content

    /// The view's body.
    public var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                VStack {
                    header(scrollView: scrollView)
                    Form {
                        content
                    }
                    .formStyle(.grouped)
                    .frame(minHeight: .generalSettingsViewSideLength)
                    .id(String.information)
                }
                .geometry { geometry in
                    scrollDisabled = geometry.frame(in: .global).origin.y >= .scrollDisabledHeight
                }
            }
            .scrollDisabled(scrollDisabled)
        }
    }

    /// The initializer of ``GeneralSettingsView``.
    /// - Parameters:
    ///   - text: The text of the scroll button.
    ///   - overview: The preview image.
    ///   - content: The controls.
    public init(
        text: LocalizedStringResource?,
        @ViewBuilder overview: () -> Overview,
        @ViewBuilder content: () -> Content
    ) {
        self.overview = overview()
        scrollText = text
        self.content = content()
    }

    /// The overview and the button for scrolling.
    /// - Parameter scrollView: The scroll view proxy for automatically scrolling down.
    /// - Returns: A view containing the overview and the scroll button.
    private func header(scrollView: ScrollViewProxy) -> some View {
        VStack(alignment: .center) {
            Spacer()
            overview
                .frame(width: .generalSettingsViewSideLength)
            Spacer()
            if let scrollText {
                Button {
                    withAnimation {
                        scrollView.scrollTo(String.information, anchor: .top)
                    }
                } label: {
                    Text(scrollText)
                        .pigeonLink()
                }
                .buttonStyle(.link)
                .padding()
            }
        }
        .frame(height: .generalSettingsViewSideLength)
    }

}

/// The previews for the ``GeneralSettingsView``.
struct GeneralSettingsView_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        GeneralSettingsView(
            text: "More"
        ) {
            Text("Overview")
        } content: {
            Text("Content")
        }

    }

}
