//
//  OrdersView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct OrdersView: View {
    let brand: StoreBrand

    @State private var orders = (1 ... 10).map { Order.random(name: "Order \($0)") }
    @State private var selection: Order.ID?
    @State private var sort = [KeyPathComparator(\Order.name)]
    @State private var editing: Order?
    @State private var pdfOrder: Order?

    var body: some View {
        NavigationStack {
            Table(of: Order.self, selection: $selection, sortOrder: $sort) {
                TableColumn("Name", value: \.name)
                TableColumn("Customer", value: \.customerName)
                TableColumn("Amount") { Text("$ \($0.price, specifier: "%.2f")") }
                    .alignment(.trailing)
                TableColumn("Items", value: \.quantityDisplay).alignment(.center)
                TableColumn("Status") { order in
                    Text(order.isClosed ? "Closed" : "Open")
                        .foregroundStyle(order.isClosed ? .red : .green)
                }
                TableColumn("Modified") { Text($0.modified, style: .date) }
            } rows: {
                ForEach(orders.sorted(using: sort)) { order in
                    TableRow(order)
                        .contextMenu {
                            Button("Edit") { editing = order }
                            Button("Show PDF") { pdfOrder = order }
                            Divider()
                            Button("Delete", role: .destructive) { delete(order) }
                        }
                }
            }
            .navigationTitle("Orders")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("New Order", systemImage: "plus") { editing = Order.random(name: "New Order") }
                }
            }
            .sheet(item: $editing) { order in
                NavigationStack { OrderEditorView(brand: brand, order: order) }
            }
            .sheet(item: $pdfOrder) { _ in
                NavigationStack { PDFViewer() }
            }
        }
    }

    private func delete(_ order: Order) {
        orders.removeAll { $0.id == order.id }
    }
}
