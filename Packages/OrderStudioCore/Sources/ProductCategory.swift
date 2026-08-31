//
//  ProductCategory.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import Foundation

public struct ProductCategory: Identifiable, Hashable, Sendable {
    public let id = UUID()
    public var name: String
    public var subcategories: [ProductCategory]?

    public init(name: String, subcategories: [ProductCategory]? = nil) {
        self.name = name
        self.subcategories = subcategories
    }
}

public extension ProductCategory {
    static let mocks: [ProductCategory] = [
        ProductCategory(name: "Apparel", subcategories: [
            ProductCategory(name: "Tops", subcategories: [ProductCategory(name: "T-Shirts"), ProductCategory(name: "Hoodies"), ProductCategory(name: "Sweatshirts")]),
            ProductCategory(name: "Bottoms", subcategories: [ProductCategory(name: "Jeans"), ProductCategory(name: "Shorts")]),
            ProductCategory(name: "Outerwear", subcategories: [ProductCategory(name: "Jackets"), ProductCategory(name: "Rain Ponchos")]),
        ]),
        ProductCategory(name: "Footwear", subcategories: [ProductCategory(name: "Sneakers"), ProductCategory(name: "Trail Runners")]),
        ProductCategory(name: "Accessories", subcategories: [ProductCategory(name: "Hats"), ProductCategory(name: "Beanies"), ProductCategory(name: "Scarves"), ProductCategory(name: "Backpacks")]),
    ]
}
