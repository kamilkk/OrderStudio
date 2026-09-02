//
//  CustomerAvatar.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import OrderStudioCore
import SwiftUI

struct CustomerAvatar: View {
    let customer: Customer
    let tint: Color
    var diameter: CGFloat = 44
    var filled: Bool = true // filled = brand tint bg + white text; else tinted-on-subtle

    var body: some View {
        Text(customer.initials)
            .font(.system(size: diameter * 0.4, weight: .semibold))
            .foregroundStyle(filled ? Color.white : tint)
            .frame(width: diameter, height: diameter)
            .background(filled ? tint : tint.opacity(0.12), in: .circle)
            .accessibilityHidden(true) // name is already read by the surrounding row/header
    }
}

#Preview {
    HStack(spacing: 16) {
        CustomerAvatar(customer: PreviewData.customer, tint: PreviewData.tint, diameter: 64, filled: true)
        CustomerAvatar(customer: PreviewData.customer, tint: PreviewData.tint, diameter: 40, filled: false)
    }
    .padding()
}
