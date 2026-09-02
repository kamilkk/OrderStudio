//
//  CustomerDetailView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct CustomerDetailView: View {
    let customer: Customer
    let brand: StoreBrand

    @Environment(\.horizontalSizeClass) private var hSize
    @State private var recentOrders: [Order] = []

    private var isRegular: Bool { hSize == .regular }
    private var stats: CustomerStats { customer.stats }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                CustomerHeader(customer: customer, brand: brand)

                if !isRegular { contactActionRow } // iPhone-only Call/Email/Map

                SectionCard(title: "Order statistics", trailing: isRegular ? "Last 8 months" : "8 mo") {
                    StatGrid(stats: stats, tint: brand.tint)
                }

                charts

                cards
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle(isRegular ? "" : customer.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { toolbarContent }
        .task(id: customer.id) {
            recentOrders = (1 ... 4).map { Order.random(name: "Order \($0)") }
        }
    }

    @ViewBuilder private var charts: some View {
        let bar = SectionCard(title: "Orders per month", trailing: isRegular ? nil : "8 mo") {
            OrdersBarChart(months: stats.monthly, tint: brand.tint, compactLabels: !isRegular)
        }
        let donut = SectionCard(title: "Order status") {
            OrderStatusDonut(stats: stats, tint: brand.tint)
        }
        if isRegular {
            HStack(alignment: .top, spacing: 16) {
                bar.frame(maxWidth: .infinity)
                donut.fixedSize(horizontal: false, vertical: true)
            }
        } else {
            bar
            donut
        }
    }

    @ViewBuilder private var cards: some View {
        let address = AddressCard(customer: customer, tint: brand.tint)
        let recent = RecentOrdersCard(orders: recentOrders)
        if isRegular {
            HStack(alignment: .top, spacing: 16) {
                address.frame(maxWidth: .infinity)
                recent.frame(maxWidth: .infinity)
            }
        } else {
            address
            recent
        }
    }

    private var contactActionRow: some View {
        HStack(spacing: 12) {
            ContactActionButton(icon: "IconPhone", title: "Call", tint: brand.tint) {
                open("tel:\(customer.phone.filter { $0.isNumber })")
            }
            ContactActionButton(icon: "IconEmail", title: "Email", tint: brand.tint) {
                open("mailto:\(customer.email)")
            }
            ContactActionButton(icon: "IconMapPin", title: "Map", tint: brand.tint) {
                open("maps://?ll=\(customer.latitude),\(customer.longitude)")
            }
        }
    }

    @ToolbarContentBuilder private var toolbarContent: some ToolbarContent {
        if isRegular {
            ToolbarItemGroup(placement: .topBarTrailing) {
                CircleIconButton(icon: "IconShare", tint: brand.tint) { /* share sheet */ }
                    .accessibilityLabel("Share")
                CircleIconButton(icon: "IconAdd", filled: true, tint: brand.tint) { /* new order */ }
                    .accessibilityLabel("New order")
            }
        } else {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") { /* edit customer */ }
            }
        }
    }

    private func open(_ string: String) {
        #if canImport(UIKit)
            if let url = URL(string: string) { UIApplication.shared.open(url) }
        #endif
    }
}
