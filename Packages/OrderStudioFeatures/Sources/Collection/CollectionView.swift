//
//  CollectionView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import ModernDesignSystem
import OrderStudioCore
import SwiftUI

struct CollectionView: View {
    enum Mode { case collection, order }
    let brand: StoreBrand
    var mode: Mode = .collection
    @Binding var floatingPosition: CGPoint
    let onAdd: () -> Void

    @State private var products: [Product] = []
    @State private var selectedProduct: Product?
    @State private var searchText = ""

    private let columns = [GridItem(.adaptive(minimum: 220), spacing: 24)]

    var body: some View {
        NavigationSplitView {
            List(ProductCategory.mocks) { category in CategoryRow(category: category) }
                .navigationTitle("Categories")
        } detail: {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(filtered) { product in
                        ProductCard(
                            title: product.name,
                            description: "WP \(product.wholesale) · RRP \(product.retail)",
                            price: "\(product.retail)",
                            localImage: Image(uiImage: UIImage(named: product.assetName(for: brand))
                                ?? UIImage(systemName: product.symbol)
                                ?? UIImage(systemName: "shippingbox")!)
                        ) { selectedProduct = product }
                            .onDrag { NSItemProvider(object: product.id.uuidString as NSString) }
                    }
                }
                .padding()
            }
            .navigationTitle("Products (\(filtered.count))")
        }
        .searchable(text: $searchText)
        .task { if products.isEmpty { products = Product.catalogue(for: brand) } }
        .fullScreenCover(item: $selectedProduct) { product in
            ProductPager(products: filtered, current: product, brand: brand, mode: mode,
                         floatingPosition: $floatingPosition) { selectedProduct = nil }
        }
    }

    private var filtered: [Product] {
        searchText.isEmpty ? products
            : products.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
