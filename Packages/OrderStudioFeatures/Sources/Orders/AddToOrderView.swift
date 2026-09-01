//
//  AddToOrderView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct AddToOrderView: View {
    let brand: StoreBrand
    @Binding var basketPosition: CGPoint
    let onDone: () -> Void

    var body: some View {
        NavigationStack {
            CollectionView(brand: brand, mode: .order, floatingPosition: $basketPosition) {}
                .navigationTitle("Add to Order")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) { Button("Done") { onDone() } }
                    ToolbarItem(placement: .cancellationAction) { Button("Cancel") { onDone() } }
                }
        }
    }
}
