//
//  BrandsGridView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import ModernDesignSystem
import OrderStudioCore
import SwiftUI

public struct BrandsGridView: View {
    @EnvironmentObject private var ds: ModernDesignSystem
    @Namespace private var namespace
    @State private var brands: [StoreBrand] = []
    @State private var selected: StoreBrand?
    @State private var searchText = ""
    @State private var isRefreshing = false
    @State private var showSettings = false

    private let columns = [GridItem(.adaptive(minimum: 220), spacing: 24)]

    public init() {}

    public var body: some View {
        NavigationStack {
            Group {
                if filtered.isEmpty {
                    EmptyStateView.noSearchResults(query: searchText) // MDS empty state
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(filtered) { brand in
                                Button {
                                    selected = brand
                                } label: {
                                    brand.logoImage
                                        .resizable().scaledToFit()
                                        .padding(28)
                                        .frame(maxWidth: .infinity, minHeight: 150)
                                        .background(.background, in: .rect(cornerRadius: 16))
                                        .overlay { RoundedRectangle(cornerRadius: 16).stroke(.quaternary, lineWidth: 1) }
                                        .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
                                        .accessibilityLabel(brand.name)
                                }
                                .buttonStyle(.plain) // a11y: real Button
                                .matchedTransitionSource(id: brand, in: namespace)
                            }
                        }
                        .padding()
                    }
                    .refreshable { await refresh() } // awaits directly (fix)
                }
            }
            .navigationTitle("My Brands (\(brands.count))")
            .searchable(text: $searchText)
            .task {
                guard brands.isEmpty else { return } // seed once (fix)
                brands = StoreBrand.all
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showSettings = true } label: { Image(systemName: "gearshape") }
                        .accessibilityLabel("Settings")
                }
            }
            .sheet(isPresented: $showSettings) { SettingsView() }
        }
        // THE FIX: full-screen, not a sheet.
        .fullScreenCover(item: $selected) { brand in
            ContainerView(brand: brand)
                .environmentObject(ds)
                .tint(brand.tint)
                .navigationTransition(.zoom(sourceID: brand, in: namespace))
        }
    }

    private var filtered: [StoreBrand] {
        searchText.isEmpty ? brands
            : brands.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    private func refresh() async {
        isRefreshing = true
        try? await Task.sleep(for: .seconds(1))
        isRefreshing = false
    }
}
