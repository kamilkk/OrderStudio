//
//  ProductDetailView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import ModernDesignSystem
import OrderStudioCore
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    let brand: StoreBrand
    let mode: CollectionView.Mode
    let onClose: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(product.name).font(.title).bold()
                Spacer()
                Button { onClose() } label: {
                    Image(systemName: "xmark.circle.fill").font(.title2)
                }
                .accessibilityLabel("Close")
            }

            ProductImage(product: product, brand: brand)
                .frame(maxWidth: 520, maxHeight: 360)
                .clipShape(.rect(cornerRadius: 16))

            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Wholesale").font(.caption).foregroundStyle(.secondary)
                    Text("\(product.wholesale) EUR").font(.headline)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text("RRP").font(.caption).foregroundStyle(.secondary)
                    Text("\(product.retail) EUR").font(.headline)
                }
            }
            .padding(.horizontal)

            if mode == .order {
                Button("Add to Order", systemImage: "bag.badge.plus") { onClose() }
                    .buttonStyle(ModernButtonStyle(type: .primary, size: .medium))
            }

            Spacer()
        }
        .padding(24)
    }
}
