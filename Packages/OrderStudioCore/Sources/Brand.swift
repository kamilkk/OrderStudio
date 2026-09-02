//
//  Brand.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import SwiftUI

public struct StoreBrand: Identifiable, Hashable, Sendable {
    public let id = UUID()
    public let name: String
    public let asset: String

    public init(name: String, asset: String) {
        self.name = name
        self.asset = asset
    }

    // Brand accent, resolved from the asset catalog: "BrandVeloce", "BrandMeridian", …
    // Single source of truth — the designer controls the value in OrderStudio.xcassets.
    public var tint: Color { Color("Brand\(asset)") }

    // Vector brand art from OrderStudio.xcassets (main bundle).
    public var logoImage: Image { Image("\(asset)Logo") }
    public var markImage: Image { Image("\(asset)Mark") }
    public var splashImage: Image { Image("\(asset)Splash") }

    public func hash(into hasher: inout Hasher) { hasher.combine(name) }
    public static func == (l: StoreBrand, r: StoreBrand) -> Bool { l.name == r.name }
}

public extension StoreBrand {
    static let all: [StoreBrand] = [
        .init(name: "Northpeak", asset: "Northpeak"),
        .init(name: "Auralux", asset: "Auralux"),
        .init(name: "Veloce", asset: "Veloce"),
        .init(name: "Meridian & Co.", asset: "Meridian"),
        .init(name: "Lumen Studio", asset: "Lumen"),
        .init(name: "Bramblewood", asset: "Bramblewood"),
    ]
}
