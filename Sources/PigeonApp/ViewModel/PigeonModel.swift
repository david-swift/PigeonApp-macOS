//
//  PigeonModel.swift
//  PigeonApp
//
//  Created by david-swift on 18.02.23.
//

import ActionKit
import ColibriComponents
import Foundation
import SwiftUI

/// This class manages the data used in the default settings and menu bar.
public class PigeonModel: ObservableObject {

    /// A shared instance of the ``PigeonModel``.
    static var shared = PigeonModel()

    /// The data used for customizing the user experience.
    @Published public var settings: PigeonSettingsData {
        didSet {
            set()
            let data = try? JSONEncoder().encode(settings)
            if let data {
                UserDefaults.standard.set(data, forKey: .settingsData)
            }
            setData()
        }
    }
    /// Data defined by the coder.
    @Published public var pigeonCodeModel: PigeonCodeModel
    /// The behaviors.
    @Published var behaviors: [(LocalizedStringResource, FunctionEditor)]
    /// Whether the last synchronization task succeeded and, if not, the error message.
    @Published var synchronizationSuccess: (Bool, String) = (false, .init())
    /// Whether the data is already synchronized.
    @Published var gotData = false
    /// The data for synchronization with the Supabase database.
    @Published var supabaseData: Data? {
        didSet {
            if gotData {
                setData()
            }
        }
    }
    /// A closure for updating the local data from the Supabase database.
    @Published var updateSupabaseData: (Data) -> Void = { _ in } {
        didSet {
            getData()
        }
    }

    /// The initializer of a ``PigeonModel``.
    /// - Parameters:
    ///   - information: Information defined by the coder.
    ///   - templates: The template groups.
    init(information: CodeInformation = .init(), templates: [TemplateFolder] = []) {
        settings = .init(templates: templates)
        if let data = UserDefaults.standard.data(forKey: .settingsData),
            let decoded = try? JSONDecoder().decode(PigeonSettingsData.self, from: data) {
            settings = decoded
        }
        pigeonCodeModel = .init(information: information)
        behaviors = []
    }

    /// A row in the Supabase database.
    private struct SupabaseType: Codable {

        /// The row's identifier.
        let id: Int
        /// The data.
        let data: String

    }

    /// Set the settings.
    /// - Parameter information: The code information.
    func setSettings(information: CodeInformation) {
        pigeonCodeModel.setSettings(information: information)
    }

    /// Set the appearance and the toolbar style.
    func set() {
        PigeonAppAction.setAppearance(settings.appearance)
        PigeonAppAction.setToolbarStyle(
            displayMode: settings.toolbarDisplayMode,
            style: settings.toolbarStyle
        )
    }

    /// Update the data in the Supabase database.
    func setData() {
        if let supabaseData, let client = settings.client {
            let data = SupabaseType(id: settings.supabaseRowID, data: .init(decoding: supabaseData, as: UTF8.self))
            let tableID = pigeonCodeModel.information.appData.supabaseTable
            let table = client.database.from(tableID)
            let updateQuery = table
                .update(values: data)
                .eq(column: "id", value: settings.supabaseRowID)
            let insertQuery = table
                .insert(values: data)
            Task { @MainActor in
                do {
                    do {
                        try await updateQuery.execute()
                        try await insertQuery.execute()
                    } catch {
                        if !error.localizedDescription.hasSuffix("409.") {
                            throw error
                        }
                    }
                    synchronizationSuccess = (true, .init())
                } catch {
                    synchronizationSuccess = (false, error.localizedDescription)
                }
            }
        }
    }

    /// Update the local data from the Supabase database.
    func getData() {
        if let client = settings.client, !gotData {
            let realtime = client.realtime
            let tableID = pigeonCodeModel.information.appData.supabaseTable
            print(tableID)
            let userChanges = realtime.channel(.table(tableID, schema: "public"))
            realtime.connect()
            userChanges.on(.all) { _ in
                let query = client.database
                    .from(tableID)
                    .select()
                Task {
                    do {
                        let response: [SupabaseType] = try await query.execute().value
                        let string = response.first { $0.id == self.settings.supabaseRowID }?.data
                        if let data = string?.data(using: .utf8) {
                            self.updateSupabaseData(data)
                        }
                    } catch {
                        self.synchronizationSuccess = (false, error.localizedDescription)
                    }
                }
            }
            userChanges.subscribe()
            gotData = true
        }
    }

}
