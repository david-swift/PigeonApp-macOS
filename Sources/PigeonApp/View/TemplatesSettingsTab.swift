//
//  TemplatesSettingsTab.swift
//  PigeonApp
//
//  Created by david-swift on 05.03.23.
//

import ColibriComponents
import SFSafeSymbols
import SwiftUI

/// A settings subtab for editing a folder.
struct TemplatesSettingsTab: View {

    /// The active template folder.
    @Binding var group: TemplateFolder
    /// Whether the group icons picker overlay is displayed.
    @State private var showGroupIcons = false
    /// Whether the template icons picker overlay is displayed.
    @State private var showTemplateIcons = false
    /// The filter of the icons.
    @State private var filter = ""
    /// The selected template.
    @State private var selection: UUID?
    /// Whether the delete overlay is displayed.
    @State private var delete = false
    /// All of the available ``SFSymbol`` icons.
    let icons = Array(SFSymbol.allSymbols).filter { !$0.rawValue.hasSuffix(".fill") }

    /// The view's body.
    var body: some View {
        Form {
            folder
            content
        }
        .formStyle(.grouped)
    }

    /// The section for editing the folder.
    var folder: some View {
        Section(.init("Folder", comment: "TemplatesSettingsTab (Title of the folder section)") ) {
            iconTitlePicker(title: $group.title, icon: $group.icon, showIcons: $showGroupIcons)
                .padding(.leading, .iconTitlePickerPadding)
        }
    }

    /// The section for editing the templates.
    var content: some View {
        Section(.init("Content", comment: "TemplatesSettingsTab (Title of the content section)")) {
            SelectionItemPicker(selection: (selection ?? .init()).binding { newValue in
                selection = group.templates.contains { $0.id == newValue } ? newValue : nil
            }, items: group.templates)
                .popover(item: selection.binding { newValue in
                    selection = newValue == nil && delete ? selection : newValue
                }) { selection in
                    templatePopover(selection: selection)
                }
                .confirmationDialog(
                    .init(
                        "Delete \"\(group.templates[id: selection]?.title ?? "")\"?",
                        comment: "TemplatesSettingsTab (Text in the confirmation dialog for deleting a template)"
                    ),
                    isPresented: $delete
                ) {
                    Button.deleteButton {
                        group.templates = group.templates.filter { template in
                            template.id != selection
                        }
                        selection = nil
                    }
                    Button.cancelButton {
                        (delete, selection) = (false, nil)
                    }
                } message: {
                    Text(.init(
                        "There is no undo.",
                        comment: "TemplatesSettingsTab (Warning in the confirmation dialog for deleting a template)"
                    ))
                }
        }
    }

    /// The popover with the template editing options.
    /// - Parameter selection: The selected template.
    /// - Returns: The editing view.
    func templatePopover(selection: UUID) -> some View {
        HStack {
            if let template = group.templates[id: selection] {
                iconTitlePicker(title: template.title.binding { newValue in
                    group.templates[id: selection]?.title = newValue
                }, icon: template.icon.binding { newValue in
                    group.templates[id: selection]?.icon = newValue
                }, showIcons: $showTemplateIcons)
                .labelsHidden()
                .onSubmit {
                    self.selection = nil
                }
            }
            Button.deleteButton {
                delete = true
            }
            .labelStyle(.iconOnly)
        }
        .padding()
        .frame(width: .templatePopoverWidth)
    }

    /// A button for opening the popover for selecting an icon and a text field next to it.
    /// - Parameters:
    ///   - title: The text of the text field.
    ///   - icon: The selected icon.
    ///   - showIcons: Whether the icon popover is visible.
    /// - Returns: A view containing the button and text field.
    func iconTitlePicker(title: Binding<String>, icon: Binding<SFSymbol>, showIcons: Binding<Bool>) -> some View {
        HStack {
            Button {
                showIcons.wrappedValue.toggle()
            } label: {
                Image(systemSymbol: icon.wrappedValue)
                    .accessibilityLabel(
                        .init(
                            "Pick an icon",
                            comment: "TemplatesSettingsTab (Accessibility label for the pick icons button)"
                        )
                    )
            }
            .popover(isPresented: showIcons) {
                iconPopover(icon: icon, showIcons: showIcons)
            }
            TextField(.init("Title", comment: "TemplatesSettingsTab (The text field for the title.)"), text: title)
        }
    }

    /// A popover for selecting ``SFSymbol`` icons.
    /// - Parameters:
    ///   - icon: The selected symbol.
    ///   - showIcons: Whether this view is visible.
    /// - Returns: A view for selecting ``SFSymbol`` icons.
    func iconPopover(icon: Binding<SFSymbol>, showIcons: Binding<Bool>) -> some View {
        ScrollView {
            VStack {
                TextField(.init(
                    "Search",
                    comment: "TemplatesSettingsTab (The label of the search field of the icon popover)"
                ), text: $filter)
                    .textFieldStyle(.roundedBorder)
                    .labelsHidden()
                    .padding()
                SelectionItemPicker(selection: icon.wrappedValue.rawValue.binding { rawValue in
                    icon.wrappedValue = .init(rawValue: rawValue)
                    showIcons.wrappedValue = false
                }, items: icons.filter { icon in
                    guard !filter.isEmpty else {
                        return true
                    }
                    return icon.title.lowercased().contains(filter.lowercased())
                })
            }
        }
        .frame(width: .iconPopoverWidth, height: .iconPopoverHeight)
    }

}

/// Previews for the ``TemplatesSettingsTab``.
struct TemplatesSettingsTab_Previews: PreviewProvider {

    /// The preview.
    static var previews: some View {
        TemplatesSettingsTab(group: .constant(.init(title: "", icon: .link) { }))
    }

}
