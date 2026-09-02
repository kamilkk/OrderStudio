//
//  TopCustomerBadge.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import SwiftUI

struct TopCustomerBadge: View {
    let tint: Color
    var body: some View {
        Text("Top customer")
            .font(.caption.weight(.semibold))
            .foregroundStyle(tint)
            .padding(.horizontal, 8).padding(.vertical, 3)
            .background(tint.opacity(0.12), in: .capsule)
    }
}

#Preview {
    TopCustomerBadge(tint: PreviewData.tint).padding()
}
