//
//  SectionCard.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import SwiftUI

struct SectionCard<Content: View>: View {
    let title: String
    var trailing: String? = nil // e.g. "Last 8 months" / "8 mo"
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(title).font(.headline)
                Spacer()
                if let trailing {
                    Text(trailing).font(.caption).foregroundStyle(.secondary)
                }
            }
            content
        }
        .padding(16)
        .background(Color(.secondarySystemGroupedBackground), in: .rect(cornerRadius: 18))
    }
}

#Preview {
    SectionCard(title: "Order statistics", trailing: "Last 8 months") {
        Text("Card content goes here")
    }
    .padding()
}
