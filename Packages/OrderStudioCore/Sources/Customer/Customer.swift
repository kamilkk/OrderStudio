//
//  Customer.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import Foundation

public struct Customer: Identifiable, Hashable, Sendable, Codable {
    public let id = UUID() // identity only — generated, never decoded
    public let name: String
    public let email: String
    public let phone: String
    public let address: String
    public let city: String
    public let zipCode: String
    public let latitude: Double
    public let longitude: Double
    public let since: Int // "Customer since 2019"
    public let isTopCustomer: Bool // drives the badge
    public var remarks: String
    public let stats: CustomerStats // nested analytics

    // `id` is excluded, so the synthesized decoder keeps its default UUID().
    private enum CodingKeys: String, CodingKey {
        case name, email, phone, address, city, zipCode
        case latitude, longitude, since, isTopCustomer, remarks, stats
    }

    /// "JD" — first letters of the first two words, uppercased.
    public var initials: String {
        name.split(separator: " ").prefix(2)
            .map { String($0.first ?? Character("")) }.joined().uppercased()
    }

    public var addressFormatted: String { "\(address)\n\(city), \(zipCode)" }
}

public extension Customer {
    /// Seeded from the embedded JSON resource. Swap the loader for a real source
    /// later; every caller keeps using `Customer.sampleCustomers`.
    static let sampleCustomers: [Customer] = ResourceLoader.decode("customers", as: [Customer].self)
}
