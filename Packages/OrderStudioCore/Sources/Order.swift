//
//  Order.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import Foundation

public struct OrderProduct: Identifiable, Hashable, Sendable {
    public let id = UUID()
    public let name: String
    public let price: Double
    public let quantity: Int
    public let index: Int
    public let colorIndex: String
    public let size: String

    public init(name: String, price: Double, quantity: Int, index: Int, colorIndex: String, size: String) {
        self.name = name; self.price = price; self.quantity = quantity
        self.index = index; self.colorIndex = colorIndex; self.size = size
    }

    public static func mocked() -> [OrderProduct] {
        [
            .init(name: "T-Shirt", price: 19.99, quantity: 2, index: 1008, colorIndex: "020 Navy", size: "M"),
            .init(name: "Jeans", price: 49.99, quantity: 1, index: 1002, colorIndex: "030 Indigo", size: "32"),
            .init(name: "Sneakers", price: 89.99, quantity: 1, index: 1001, colorIndex: "Gr001", size: "43"),
            .init(name: "Jacket", price: 119.99, quantity: 1, index: 1003, colorIndex: "33 Olive", size: "L"),
            .init(name: "Hat", price: 15.99, quantity: 3, index: 1004, colorIndex: "7H", size: "One Size"),
        ]
    }
}

public struct Order: Identifiable, Hashable, Sendable {
    public let id: String
    public let price: Double
    public let quantity: Int
    public let name: String
    public let isClosed: Bool
    public let isPreorder: Bool
    public let modified: Date
    public let customerName: String
    public let products: [OrderProduct]

    public var quantityDisplay: String { "\(quantity)" }

    public init(id: String = UUID().uuidString, price: Double, quantity: Int, name: String,
                isClosed: Bool, isPreorder: Bool, modified: Date, customerName: String,
                products: [OrderProduct])
    {
        self.id = id; self.price = price; self.quantity = quantity; self.name = name
        self.isClosed = isClosed; self.isPreorder = isPreorder; self.modified = modified
        self.customerName = customerName; self.products = products
    }

    public static func random(name: String, closed: Bool = .random()) -> Order {
        Order(
            price: Double.random(in: 100 ... 10000),
            quantity: Int.random(in: 1 ... 100),
            name: name,
            isClosed: closed,
            isPreorder: .random(),
            modified: Date().addingTimeInterval(-Double.random(in: 0 ... 100) * 3600),
            customerName: ["Northgate Retail", "Harbourline Trading", "Kestrel & Vale"].randomElement()!,
            products: OrderProduct.mocked()
        )
    }
}
