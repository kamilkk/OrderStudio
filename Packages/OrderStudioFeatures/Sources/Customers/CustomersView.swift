//
//  CustomersView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import ModernDesignSystem
import OrderStudioCore
import SwiftUI

struct CustomersView: View {
    @State private var selected: Customer?
    @State private var customers = Customer.sampleCustomers
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            List(filtered, selection: $selected) { customer in
                Text(customer.name).tag(customer)
            }
            .navigationTitle("Customers")
            .searchable(text: $searchText)
        } detail: {
            if let selected {
                CustomerDetailView(customer: selected)
            } else {
                EmptyStateView(
                    image: Image(systemName: "person.2"),
                    title: "No customer selected",
                    subtitle: "Pick a customer to see details and orders"
                )
            }
        }
    }

    private var filtered: [Customer] {
        searchText.isEmpty ? customers
            : customers.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
