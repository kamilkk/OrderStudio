//
//  Brand.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import SwiftUI

public struct StoreBrand: Identifiable, Hashable, Sendable {
    public let id = UUID()
    public let name: String // display name, e.g. "Meridian & Co."
    public let asset: String // asset-name prefix, e.g. "Meridian"
    public let tint: Color // SwiftUI accent (brand colour is also baked into the SVGs)
    public let isSynchronized: Bool

    public init(name: String, asset: String, tint: Color, isSynchronized: Bool) {
        self.name = name
        self.asset = asset
        self.tint = tint
        self.isSynchronized = isSynchronized
    }

    // Vector brand art from OrderStudio.xcassets (main bundle).
    public var logoImage: Image { Image("\(asset)Logo") }
    public var markImage: Image { Image("\(asset)Mark") }
    public var splashImage: Image { Image("\(asset)Splash") }

    public func hash(into hasher: inout Hasher) { hasher.combine(name) }
    public static func == (l: StoreBrand, r: StoreBrand) -> Bool { l.name == r.name }
}

public extension StoreBrand {
    static let all: [StoreBrand] = [
        .init(name: "Northpeak", asset: "Northpeak", tint: Color(hex: 0x2E7D5B), isSynchronized: true),
        .init(name: "Auralux", asset: "Auralux", tint: Color(hex: 0x8E5CC4), isSynchronized: true),
        .init(name: "Veloce", asset: "Veloce", tint: Color(hex: 0xE4572E), isSynchronized: false),
        .init(name: "Meridian & Co.", asset: "Meridian", tint: Color(hex: 0x1F6FEB), isSynchronized: true),
        .init(name: "Lumen Studio", asset: "Lumen", tint: Color(hex: 0x0E7C86), isSynchronized: false),
        .init(name: "Bramblewood", asset: "Bramblewood", tint: Color(hex: 0x9C6B2E), isSynchronized: true),
    ]
}

// Internal hex helper, used ONLY by Core's mock tints above.
// ModernDesignSystem already ships a *public* `Color(hex:)` that UI/Features use;
// keeping this one internal (no `public`) avoids a duplicate-initializer clash.
extension Color {
    init(hex: UInt32) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xFF) / 255,
                  green: Double((hex >> 8) & 0xFF) / 255,
                  blue: Double(hex & 0xFF) / 255)
    }
}
