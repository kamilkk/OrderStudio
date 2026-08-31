//
//  OrderProductsView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct OrderProductsView: View {
    let order: Order

    var body: some View {
        Table(order.products) {
            TableColumn("Description", value: \.name)
            TableColumn("Index") { Text("\($0.index)") }.alignment(.center)
            TableColumn("Color", value: \.colorIndex).alignment(.center)
            TableColumn("Size", value: \.size).alignment(.center)
            TableColumn("Qty") { Text("\($0.quantity)") }.alignment(.center)
            TableColumn("Unit") { Text("\($0.price, specifier: "%.2f")") }.alignment(.trailing)
        }
    }
}
