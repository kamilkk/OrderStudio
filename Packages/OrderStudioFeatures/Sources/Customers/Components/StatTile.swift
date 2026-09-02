//
//  StatTile.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import SwiftUI

struct StatTile: View {
    let title: String // "Lifetime spend"
    let value: String // "$48,240"
    let caption: String // "↑ 12% YoY" or "5 open now"
    var captionTinted = false // true → caption in brand tint (growth on the highlighted tile)
    var highlighted = false // true → subtle brand-tint background
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption).foregroundStyle(.secondary)
            Text(value)
                .font(.title2.weight(.bold))
                .foregroundStyle(.primary)
                .lineLimit(1).minimumScaleFactor(0.7)
            Text(caption)
                .font(.caption2.weight(captionTinted ? .semibold : .regular))
                .foregroundStyle(captionTinted ? tint : .secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(
            highlighted ? tint.opacity(0.10) : Color(.secondarySystemGroupedBackground),
            in: .rect(cornerRadius: 14)
        )
    }
}
