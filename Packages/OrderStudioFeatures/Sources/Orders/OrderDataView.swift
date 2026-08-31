//
//  OrderDataView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import SwiftUI

struct OrderDataView: View {
    var body: some View {
        HStack(spacing: 0) {
            infoList("Customer", ["Jan Fisher", "Best Hats GmbH"])
            infoList("Delivery", ["1234 California", "123 Street"])
            infoList("Season", ["Fall/Winter 2025", "Summer 2025"])
            infoList("Delivery date", ["Jun 1 – Dec 31, 2025", "Pricelist: Top Customer"])
        }
    }

    private func infoList(_ title: String, _ lines: [String]) -> some View {
        List {
            Section(title) {
                ForEach(lines, id: \.self) { Text($0) }
            }
        }
    }
}
