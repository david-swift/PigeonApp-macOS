//
//  TestAppApp.swift
//  PigeonApp
//
//  Created by david-swift on 19.02.23.
//

import ActionKit
import ColibriComponents
import PigeonApp
import SettingsKit
import SwiftUI

/// An app for testing the PigeonApp package.
@main
struct TestAppApp: App {

    /// The first function in the behaviors tab.
    @State private var function1 = Function(id: "", name: "", description: "", functions: .default)
    /// The second function in the behaviors tab.
    @State private var function2 = Function(id: "", name: "", description: "", functions: .default)

    /// The app.
    var body: some Scene {
        PigeonApp(appName: "TestApp", appIcon: .init(nsImage: .init(named: "AppIcon") ?? .init())) { _, _, _ in
            NavigationSplitView {
                Text("Sidebar")
                    .toolbar(id: "sidebar") {
                        ToolbarItem(id: "hello") {
                            Button("Hello") { }
                        }
                    }
            } detail: {
                Text("Detail")
                    .toolbar(id: "detail") {
                        ToolbarItem(id: "world") {
                            Button("World") { }
                        }
                    }
            }
        }
        .information(description: "Description") {
            ("Repository", .string("https://github.com/user/repository"))
            ("Another Link", .string("https://example.com/"))
        } contributors: {
            ("david-swift", .string("https://github.com/david-swift"))
        } acknowledgements: {
            ("GitHub", .string("https://github.com/"))
        }
        .help("YourApp Help", link: .string("https://example.com/"))
        .pigeonSettings {
            SettingsTab(.init("Cool", systemSymbol: .hare), id: "cool") {
                SettingsSubtab(.noSelection, id: "tab") {
                    Text("The default tab.")
                }
            }
        }
        .templates {
            TemplateFolder(title: "Hello", icon: .handWave) {
                Template(title: "Teddy", icon: .teddybear, content: .init())
            }
        }
        .themes { theme in
            Text("That's the preview!")
                .padding()
                .foregroundColor(theme.activeTheme(scheme: .light).primaryAccent)
                .background(theme.activeTheme(scheme: .light).background)
        }
        .newestVersion(gitHubUser: "david-swift", gitHubRepo: "ColibriComponents-macOS")
        .versions {
            Version("1.0.2", date: .now) {
                Version.Feature("Cooler App Icon", description: "Update the app icon design.", icon: .app)
            }
            Version("1.0.1", date: .distantPast) {
                Version.Feature("Nicer Settings", description: "Add some settings tabs.", icon: .gearshape)
                Version.Feature("Updated Design", description: "Add rounded corners to every button.", icon: .rectangle)
            }
            Version("1.0.0", date: .distantPast) {
                Version.Feature("Initial Release", description: "YourApp is here!", icon: .partyPopper)
            }
        }
        .advancedSettings {
            SettingsSubtab(.init("Location", systemSymbol: .location), id: "location") {
                Text("Location")
            }
        }
        .behaviors {
            ("Function 1", .init($function1))
            ("Function 2", .init($function2))
        }
    }
}
