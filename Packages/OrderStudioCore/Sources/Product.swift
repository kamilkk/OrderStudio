//
//  Product.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import Foundation

public struct Product: Identifiable, Hashable, Codable, Sendable {
    public let id = UUID()
    public var name: String
    public var code: String // "01"..."14"; image asset = "‹BrandAsset›_product_‹code›"
    public var symbol: String // SF Symbol fallback until per-brand art is added
    public var wholesale: Decimal
    public var retail: Decimal
    public var index: Int

    public init(name: String, code: String, symbol: String,
                wholesale: Decimal, retail: Decimal, index: Int)
    {
        self.name = name; self.code = code; self.symbol = symbol
        self.wholesale = wholesale; self.retail = retail; self.index = index
    }

    /// Per-brand image asset name, e.g. "Northpeak_product_01".
    public func assetName(for brand: StoreBrand) -> String { "\(brand.asset)_product_\(code)" }

    // `id` is identity only — keep it out of Codable (its default can't be decoded).
    private enum CodingKeys: String, CodingKey {
        case name, code, symbol, wholesale, retail, index
    }
}

public extension Product {
    // Catalogue of items (original + new); images are per-brand — see assetName(for:).
    static let catalogue: [Product] = [
        .init(name: "Sneakers", code: "01", symbol: "shoe.2", wholesale: 24.90, retail: 59.95, index: 1001),
        .init(name: "Jeans", code: "02", symbol: "figure.stand", wholesale: 31.99, retail: 79.95, index: 1002),
        .init(name: "Jacket", code: "03", symbol: "figure.arms.open", wholesale: 59.00, retail: 149.0, index: 1003),
        .init(name: "Hat", code: "04", symbol: "hat.widebrim", wholesale: 8.50, retail: 19.95, index: 1004),
        .init(name: "Shorts", code: "05", symbol: "figure.walk", wholesale: 14.00, retail: 34.95, index: 1005),
        .init(name: "Dress", code: "06", symbol: "figure.dress.line", wholesale: 39.00, retail: 99.00, index: 1006),
        .init(name: "Sweatshirt", code: "07", symbol: "tshirt", wholesale: 22.00, retail: 54.95, index: 1007),
        .init(name: "T-Shirt", code: "08", symbol: "tshirt.fill", wholesale: 9.90, retail: 24.95, index: 1008),
        .init(name: "Hoodie", code: "09", symbol: "hoodie", wholesale: 27.00, retail: 64.95, index: 1009),
        // ---- NEW products ----
        .init(name: "Backpack", code: "10", symbol: "backpack", wholesale: 34.00, retail: 89.00, index: 1010),
        .init(name: "Beanie", code: "11", symbol: "hat.cap", wholesale: 6.50, retail: 16.95, index: 1011),
        .init(name: "Rain Poncho", code: "12", symbol: "cloud.rain", wholesale: 18.00, retail: 44.95, index: 1012),
        .init(name: "Trail Runners", code: "13", symbol: "figure.run", wholesale: 45.00, retail: 119.0, index: 1013),
        .init(name: "Scarf", code: "14", symbol: "scribble.variable", wholesale: 11.00, retail: 29.95, index: 1014),
    ]

    /// Per-brand variation: each brand exposes a stable subset so the grids differ.
    static func catalogue(for brand: StoreBrand) -> [Product] {
        let seed = abs(brand.name.hashValue)
        return catalogue.enumerated()
            .filter { ($0.offset + seed) % 5 != 0 }
            .map(\.element) // deterministic subset
    }
}
