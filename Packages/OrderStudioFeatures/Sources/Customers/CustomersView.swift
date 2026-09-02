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
    let brand: StoreBrand

    @State private var selected: Customer?
    @State private var customers = Customer.sampleCustomers
    @State private var searchText = ""
    @State private var columnVisibility: NavigationSplitViewVisibility = .all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(filtered, selection: $selected) { customer in
                CustomerRow(customer: customer,
                            isSelected: customer == selected,
                            tint: brand.tint)
                    .tag(customer)
            }
            .listStyle(.plain)
            .navigationTitle("Customers")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation { columnVisibility = columnVisibility == .all ? .detailOnly : .all }
                    } label: {
                        Image("IconSidebar").renderingMode(.template)
                    }
                    .accessibilityLabel("Toggle sidebar")
                }
            }
        } detail: {
            if let selected {
                CustomerDetailView(customer: selected, brand: brand)
            } else {
                EmptyStateView(
                    image: Image(systemName: "person.2"),
                    title: "No customer selected",
                    subtitle: "Pick a customer to see details and orders"
                )
                .tint(brand.tint)
            }
        }
        .task {
            if selected == nil { selected = customers.first } // preselect like the mockup
        }
    }

    private var filtered: [Customer] {
        searchText.isEmpty ? customers
            : customers.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                    $0.city.localizedCaseInsensitiveContains(searchText)
            }
    }
}
