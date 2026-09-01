//
//  CustomerDetailView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import MapKit
import OrderStudioCore
import SwiftUI

struct CustomerDetailView: View {
    let customer: Customer

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: customer.latitude, longitude: customer.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }

    var body: some View {
        List {
            Section("Address") {
                Text(customer.addressFormatted)
                Map(initialPosition: .region(region))
                    .frame(height: 160)
                    .clipShape(.rect(cornerRadius: 12))
                    .allowsHitTesting(false)
            }
            Section("Info") {
                LabeledContent("Phone", value: customer.phone)
                LabeledContent("Email", value: customer.email)
            }
            Section("Remarks") {
                Text(customer.remarks.isEmpty ? "—" : customer.remarks)
            }
            Section("Recent Orders") {
                RecentOrdersList()
            }
        }
        .navigationTitle(customer.name)
    }
}

private struct RecentOrdersList: View {
    @State private var orders = (1 ... 4).map { Order.random(name: "Order \($0)") }

    var body: some View {
        ForEach(orders) { order in
            HStack {
                Text(order.name)
                Spacer()
                Text(order.isClosed ? "Closed" : "Open")
                    .foregroundStyle(order.isClosed ? .red : .green)
            }
        }
    }
}
