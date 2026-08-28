//
//  OrderStudioApp.swift
//  OrderStudio
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import ModernDesignSystem
import OrderStudioFeatures
import OrderStudioUI
import SwiftUI
import TipKit

@main
struct OrderStudioApp: App {
    @StateObject private var designSystem = DesignSystemFactory.make()

    var body: some Scene {
        WindowGroup {
            BrandsGridView()
                .environmentObject(designSystem) // MDS injection (P4)
                .tint(designSystem.currentColorSet.tintColor) // app-wide accent; per-brand tint applied in Phase 7
                .task { try? Tips.configure() } // side effects out of init()
        }
    }
}
