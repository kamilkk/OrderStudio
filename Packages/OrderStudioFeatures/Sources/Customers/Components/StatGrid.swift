//
//  StatGrid.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import OrderStudioCore
import SwiftUI

struct StatGrid: View {
    let stats: CustomerStats
    let tint: Color

    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 12)]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            StatTile(title: "Lifetime spend", value: Money.string(stats.lifetimeSpend),
                     caption: "↑ \(stats.spendYoYPercent)% YoY", captionTinted: true,
                     highlighted: true, tint: tint)
            StatTile(title: "Total orders", value: "\(stats.totalOrders)",
                     caption: "\(stats.openOrders) open now", tint: tint)
            StatTile(title: "Avg. order", value: Money.string(stats.avgOrder),
                     caption: "↑ \(stats.avgOrderDeltaPercent)%", captionTinted: true, tint: tint)
            StatTile(title: "On-time rate", value: "\(stats.onTimePercent)%",
                     caption: "\(stats.fulfilledCount) fulfilled", tint: tint)
        }
    }
}

#Preview {
    StatGrid(stats: PreviewData.stats, tint: PreviewData.tint).padding()
}
