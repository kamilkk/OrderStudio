//
//  OrderStudioWidgetBundle.swift
//  OrderStudioWidget
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import SwiftUI
import WidgetKit

struct OrderStudioEntry: TimelineEntry {
    let date: Date
    let openOrders: Int
}

struct Provider: TimelineProvider {
    func placeholder(in _: Context) -> OrderStudioEntry { .init(date: .now, openOrders: 3) }

    func getSnapshot(in _: Context, completion: @escaping (OrderStudioEntry) -> Void) {
        completion(.init(date: .now, openOrders: 3))
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<OrderStudioEntry>) -> Void) {
        completion(Timeline(entries: [.init(date: .now, openOrders: Int.random(in: 1 ... 5))], policy: .never))
    }
}

struct OrderStudioWidgetEntryView: View {
    @Environment(\.widgetFamily) private var family
    let entry: OrderStudioEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Open Orders").font(.callout)
            Text("\(entry.openOrders)")
                .font(.system(size: family == .systemSmall ? 48 : 40, weight: .bold))
                .foregroundStyle(.tint)
            if family == .systemMedium {
                Text("New data available")
                    .font(.caption)
                    .padding(.horizontal, 10).padding(.vertical, 2)
                    .background(.red.opacity(0.2), in: .capsule)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct OrderStudioWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "OrderStudioWidget", provider: Provider()) { entry in
            OrderStudioWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Order Studio")
        .description("Open orders at a glance.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

@main
struct OrderStudioWidgetBundle: WidgetBundle {
    var body: some Widget { OrderStudioWidget() }
}
