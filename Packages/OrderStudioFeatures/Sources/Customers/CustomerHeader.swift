//
//  CustomerHeader.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import OrderStudioCore
import SwiftUI

struct CustomerHeader: View {
    let customer: Customer
    let brand: StoreBrand

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            CustomerAvatar(customer: customer, tint: brand.tint, diameter: 64, filled: true)
            VStack(alignment: .leading, spacing: 6) {
                Text(customer.name)
                    .font(.largeTitle.weight(.bold))
                    .lineLimit(1).minimumScaleFactor(0.6)
                HStack(spacing: 8) {
                    if customer.isTopCustomer { TopCustomerBadge(tint: brand.tint) }
                    Text("Customer since \(String(customer.since)) · \(brand.name)")
                        .font(.subheadline).foregroundStyle(.secondary)
                        .lineLimit(1).minimumScaleFactor(0.7)
                }
            }
            Spacer(minLength: 0)
        }
    }
}
