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

    private let columns = [GridItem(.adaptive(minimum: 220), spacing: 24)]

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
                                        .resizable().scaledToFit().padding(24)
                                        .frame(maxWidth: .infinity)
                                        .aspectRatio(1, contentMode: .fit)
                                        .saturation(brand.isSynchronized ? 1 : 0)
                                        .opacity(brand.isSynchronized ? 1 : 0.3)
                                        .background(.background, in: .rect(cornerRadius: 16))
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
