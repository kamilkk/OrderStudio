//
//  OrderEditorView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct OrderEditorView: View {
    let brand: StoreBrand
    let order: Order

    @Environment(\.dismiss) private var dismiss
    @State private var showAdd = false
    @State private var basketPosition = CGPoint(x: 220, y: 140)

    var body: some View {
        VStack(spacing: 0) {
            OrderDataView().frame(height: 220)
            OrderProductsView(order: order)
        }
        .navigationTitle(order.name)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) { Button("Done") { dismiss() } }
            ToolbarItem(placement: .primaryAction) {
                Button("Add", systemImage: "bag.badge.plus") { showAdd = true }
            }
        }
        .fullScreenCover(isPresented: $showAdd) {
            AddToOrderView(brand: brand, basketPosition: $basketPosition) { showAdd = false }
        }
    }
}
