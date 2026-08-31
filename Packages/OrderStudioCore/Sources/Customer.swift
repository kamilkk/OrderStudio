//
//  Customer.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import Foundation

public struct Customer: Identifiable, Hashable, Sendable {
    public let id = UUID()
    public let name: String
    public let email: String
    public let phone: String
    public let address: String
    public let city: String
    public let zipCode: String
    public let latitude: Double
    public let longitude: Double
    public var remarks: String

    public init(name: String, email: String, phone: String, address: String, city: String,
                zipCode: String, latitude: Double = 51.5072, longitude: Double = -0.1276,
                remarks: String = "")
    {
        self.name = name; self.email = email; self.phone = phone
        self.address = address; self.city = city; self.zipCode = zipCode
        self.latitude = latitude; self.longitude = longitude; self.remarks = remarks
    }

    public var addressFormatted: String { "\(address)\n\(city), \(zipCode)\nUnited Kingdom" }
}

public extension Customer {
    static let sampleCustomers: [Customer] = [
        .init(name: "Northgate Retail", email: "buying@northgate.example", phone: "020 7946 0958",
              address: "12 Camden High St", city: "London", zipCode: "NW1 0JH",
              latitude: 51.539, longitude: -0.143, remarks: "Prefers Tuesday deliveries."),
        .init(name: "Harbourline Trading", email: "orders@harbourline.example", phone: "0151 496 0142",
              address: "3 Albert Dock", city: "Liverpool", zipCode: "L3 4AF",
              latitude: 53.400, longitude: -2.992),
        .init(name: "Kestrel & Vale", email: "hello@kestrelvale.example", phone: "0131 496 0771",
              address: "8 Grassmarket", city: "Edinburgh", zipCode: "EH1 2JU",
              latitude: 55.947, longitude: -3.195),
        .init(name: "Meadowbrook Supply", email: "supply@meadowbrook.example", phone: "0161 850 0199",
              address: "45 Deansgate", city: "Manchester", zipCode: "M3 2AY",
              latitude: 53.479, longitude: -2.245),
        .init(name: "Coastline Outfitters", email: "team@coastline.example", phone: "029 2018 0143",
              address: "17 Mermaid Quay", city: "Cardiff", zipCode: "CF10 5BZ",
              latitude: 51.463, longitude: -3.164),
    ]
}
