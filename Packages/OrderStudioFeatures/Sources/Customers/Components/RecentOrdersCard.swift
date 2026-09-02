//
//  RecentOrdersCard.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import OrderStudioCore
import OrderStudioUI
import SwiftUI

struct RecentOrdersCard: View {
    let orders: [Order]

    var body: some View {
        SectionCard(title: "Recent orders") {
            VStack(spacing: 0) {
                HStack {
                    Text("Name").frame(maxWidth: .infinity, alignment: .leading)
                    Text("Qty").frame(width: 60, alignment: .trailing)
                    Text("Status").frame(width: 80, alignment: .trailing)
                }
                .font(.caption.weight(.semibold)).foregroundStyle(.secondary)
                .padding(.bottom, 8)

                ForEach(orders) { order in
                    HStack {
                        Text(order.name).frame(maxWidth: .infinity, alignment: .leading)
                        Text(order.quantityDisplay).frame(width: 60, alignment: .trailing)
                            .foregroundStyle(.secondary)
                        statusPill(isClosed: order.isClosed)
                            .frame(width: 80, alignment: .trailing)
                    }
                    .font(.subheadline)
                    .padding(.vertical, 8)
                    if order.id != orders.last?.id { Divider() }
                }
            }
        }
    }

    private func statusPill(isClosed: Bool) -> some View {
        Text(isClosed ? "Closed" : "Open")
            .font(.caption.weight(.semibold))
            .foregroundStyle(isClosed ? OrderStatusColor.closed : OrderStatusColor.open)
            .padding(.horizontal, 8).padding(.vertical, 3)
            .background((isClosed ? OrderStatusColor.closed : OrderStatusColor.open).opacity(0.12),
                        in: .capsule)
    }
}

#Preview {
    RecentOrdersCard(orders: PreviewData.orders).padding()
}
