//
//  FloatingBasketView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import SwiftUI

struct FloatingBasketView: View {
    static let notificationName = Notification.Name("io.kamilkkowalski.OrderStudio.basketDidAdd")

    @Binding var position: CGPoint
    @State private var productCount = 0

    private let publisher = NotificationCenter.default.publisher(for: FloatingBasketView.notificationName)

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "cart.circle.fill")
                .resizable().scaledToFit().frame(width: 40)
                .foregroundStyle(.tint)
                .symbolEffect(.bounce, value: productCount)
            VStack(alignment: .leading, spacing: 2) {
                Text("Amount: \(productCount * 223) EUR")
                Text("Items: \(productCount)")
            }
            .font(.footnote)
            .padding(.trailing, 12)
        }
        .padding(8)
        .background(.thinMaterial, in: .capsule)
        .shadow(radius: 6, y: 3)
        .position(position)
        .gesture(DragGesture().onChanged { position = $0.location })
        .onReceive(publisher) { _ in productCount += 1 }
    }
}
