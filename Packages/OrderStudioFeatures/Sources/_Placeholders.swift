//
//  _Placeholders.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import OrderStudioCore
import SwiftUI

// TEMPORARY build stubs so the project compiles at every checkpoint.
// Delete each struct when you implement the real view in the noted phase.
// Only BrandsGridView is `public` (the app uses it); the rest are used
// inside OrderStudioFeatures, so `internal` is enough.

public struct BrandsGridView: View { // → Phase 7
    public init() {}
    public var body: some View { Text("BrandsGridView — Phase 7") }
}

struct HomeView: View { // → Phase 6
    let brand: StoreBrand
    var body: some View { Text("HomeView — Phase 6") }
}

struct CustomersView: View { // → Phase 9
    var body: some View { Text("CustomersView — Phase 9") }
}

struct OrdersView: View { // → Phase 10
    var body: some View { Text("OrdersView — Phase 10") }
}

struct CollectionView: View { // → Phase 8
    enum Mode { case collection, order }
    let brand: StoreBrand
    var mode: Mode = .collection
    @Binding var floatingPosition: CGPoint
    let onAdd: () -> Void
    var body: some View { Text("CollectionView — Phase 8") }
}

struct SettingsView: View { // → Phase 13
    var body: some View { Text("SettingsView — Phase 13") }
}

struct CollectionRefreshView: View { // → Phase 12
    @Binding var isPresenting: Bool
    var body: some View { Text("CollectionRefreshView — Phase 12") }
}

struct FloatingBasketView: View { // → Phase 11
    @Binding var position: CGPoint
    var body: some View { Text("Basket") }
}

struct OrderEditorView: View { // → Phase 11
    var body: some View { Text("OrderEditorView — Phase 11") }
}
