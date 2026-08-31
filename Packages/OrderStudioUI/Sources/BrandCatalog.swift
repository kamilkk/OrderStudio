//
//  BrandCatalog.swift
//  OrderStudioUI
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import ModernDesignSystem
import SwiftUI

@MainActor
public enum DesignSystemFactory {
    public static func make() -> ModernDesignSystem {
        ModernDesignSystem(brand: .make(name: "Order Studio"))
    }
}
