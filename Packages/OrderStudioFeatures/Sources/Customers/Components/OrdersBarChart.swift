//
//  OrdersBarChart.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import Charts
import OrderStudioCore
import SwiftUI

struct OrdersBarChart: View {
    let months: [MonthlyOrders]
    let tint: Color
    var compactLabels = false // single-letter month labels on iPhone

    var body: some View {
        Chart(months) { m in
            BarMark(
                x: .value("Month", m.label),
                y: .value("Orders", m.count),
                width: .fixed(compactLabels ? 14 : 22)
            )
            // Last month = current (full opacity); earlier months dimmed.
            .foregroundStyle(tint.opacity(m.label == months.last?.label ? 1.0 : 0.35))
            .cornerRadius(6)
        }
        .chartYAxis(.hidden)
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisValueLabel {
                    if let label = value.as(String.self) {
                        Text(compactLabels ? String(label.prefix(1)) : label)
                            .font(.caption2).foregroundStyle(.secondary)
                    }
                }
            }
        }
        .frame(height: 160)
        .accessibilityLabel("Orders per month")
    }
}

#if DEBUG
    #Preview {
        VStack(spacing: 24) {
            OrdersBarChart(months: PreviewData.stats.monthly, tint: PreviewData.tint)
            OrdersBarChart(months: PreviewData.stats.monthly, tint: PreviewData.tint, compactLabels: true)
        }
        .padding()
    }
#endif
