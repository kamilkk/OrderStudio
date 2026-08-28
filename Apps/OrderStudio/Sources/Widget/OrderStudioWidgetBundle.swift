//
//  OrderStudioWidgetBundle.swift
//  OrderStudioWidget
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import SwiftUI
import WidgetKit

// Placeholder widget — real widget + Live Activity added in Phase 14.
struct PlaceholderEntry: TimelineEntry { let date: Date }

struct PlaceholderProvider: TimelineProvider {
    func placeholder(in _: Context) -> PlaceholderEntry { .init(date: .now) }
    func getSnapshot(in _: Context, completion: @escaping (PlaceholderEntry) -> Void) {
        completion(.init(date: .now))
    }

    func getTimeline(in _: Context, completion: @escaping (Timeline<PlaceholderEntry>) -> Void) {
        completion(Timeline(entries: [.init(date: .now)], policy: .never))
    }
}

struct OrderStudioWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "OrderStudioWidget", provider: PlaceholderProvider()) { _ in
            Text("Order Studio")
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Order Studio")
        .description("Placeholder — real widget added in Phase 14.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

@main
struct OrderStudioWidgetBundle: WidgetBundle {
    var body: some Widget { OrderStudioWidget() }
}
