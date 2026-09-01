//
//  SettingsView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var diagnostics = true

    var body: some View {
        NavigationStack {
            List {
                Section("Agent") {
                    LabeledContent("Name", value: "John Doe")
                    LabeledContent("Email", value: "john.doe@example.com")
                }
                Section {
                    LabeledContent("Language", value: "EN (English)")
                    Toggle("Diagnostic report", isOn: $diagnostics)
                } header: {
                    Text("App")
                } footer: {
                    Text("App version: 1.0")
                }
                Section {
                    Button("Logout", role: .destructive) {}
                }
            }
            .navigationTitle("Settings")
            .presentationDetents([.medium, .large])
        }
    }
}
