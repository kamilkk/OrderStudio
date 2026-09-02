//
//  CustomerRow.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import OrderStudioCore
import SwiftUI

struct CustomerRow: View {
    let customer: Customer
    let isSelected: Bool
    let tint: Color

    var body: some View {
        HStack(spacing: 12) {
            CustomerAvatar(customer: customer, tint: tint, diameter: 40, filled: isSelected)
            VStack(alignment: .leading, spacing: 2) {
                Text(customer.name)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(isSelected ? tint : .primary)
                Text(customer.city)
                    .font(.caption).foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(customer.name), \(customer.city)")
    }
}
