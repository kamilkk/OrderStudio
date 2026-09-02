//
//  OrderStatusDonut.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import Charts
import OrderStudioCore
import SwiftUI

struct OrderStatusDonut: View {
    let stats: CustomerStats
    let tint: Color

    var body: some View {
        HStack(spacing: 20) {
            Chart {
                SectorMark(angle: .value("Open", stats.openOrders),
                           innerRadius: .ratio(0.68), angularInset: 1.5)
                    .foregroundStyle(tint) // open = brand accent
                    .cornerRadius(3)
                SectorMark(angle: .value("Closed", stats.closedOrders),
                           innerRadius: .ratio(0.68), angularInset: 1.5)
                    .foregroundStyle(Color(.systemGray4)) // closed = neutral
                    .cornerRadius(3)
            }
            .chartLegend(.hidden)
            .frame(width: 120, height: 120)
            .overlay {
                VStack(spacing: 0) {
                    Text("\(stats.totalOrders)").font(.title2.weight(.bold))
                    Text("orders").font(.caption2).foregroundStyle(.secondary)
                }
            }
            .accessibilityLabel("\(stats.openOrders) open, \(stats.closedOrders) closed, \(stats.totalOrders) total")

            VStack(alignment: .leading, spacing: 12) {
                legendRow(color: tint, title: "Open", value: stats.openOrders)
                legendRow(color: Color(.systemGray4), title: "Closed", value: stats.closedOrders)
            }
        }
    }

    private func legendRow(color: Color, title: String, value: Int) -> some View {
        HStack(spacing: 8) {
            Circle().fill(color).frame(width: 10, height: 10)
            VStack(alignment: .leading, spacing: 1) {
                Text(title).font(.caption).foregroundStyle(.secondary)
                Text("\(value)").font(.headline)
            }
        }
    }
}
