//
//  ProductPager.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct ProductPager: View {
    let products: [Product]
    let current: Product
    let brand: StoreBrand
    let mode: CollectionView.Mode
    @Binding var floatingPosition: CGPoint
    let onClose: () -> Void

    @State private var selection: UUID

    init(products: [Product], current: Product, brand: StoreBrand,
         mode: CollectionView.Mode, floatingPosition: Binding<CGPoint>,
         onClose: @escaping () -> Void)
    {
        self.products = products
        self.current = current
        self.brand = brand
        self.mode = mode
        _floatingPosition = floatingPosition
        self.onClose = onClose
        _selection = State(initialValue: current.id)
    }

    var body: some View {
        TabView(selection: $selection) {
            ForEach(products) { product in
                ProductDetailView(product: product, brand: brand, mode: mode, onClose: onClose)
                    .tag(product.id)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .background(.thinMaterial)
        .overlay {
            if mode == .order {
                FloatingBasketView(position: $floatingPosition)
            }
        }
    }
}
