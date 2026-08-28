//
//  ProductImage.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import OrderStudioCore
import SwiftUI
#if canImport(UIKit)
    import UIKit
#endif

public struct ProductImage: View {
    public let product: Product
    public let brand: StoreBrand
    public init(product: Product, brand: StoreBrand) {
        self.product = product; self.brand = brand
    }

    public var body: some View {
        let name = product.assetName(for: brand)
        #if canImport(UIKit)
            if UIImage(named: name) != nil { Image(name).resizable() } else { fallback }
        #else
            Image(name).resizable()
        #endif
    }

    private var fallback: some View {
        Image(systemName: product.symbol)
            .resizable().scaledToFit().padding(24)
            .foregroundStyle(.secondary)
    }
}
