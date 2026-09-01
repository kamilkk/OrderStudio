//
//  ContainerView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import OrderStudioCore
import SwiftUI

public struct ContainerView: View {
    let brand: StoreBrand
    enum Tabs: Hashable { case home, customers, orders, collection }
    @State private var selection: Tabs = .home

    public var body: some View {
        TabView(selection: $selection) {
            Tab("Home", systemImage: "house", value: .home) {
                HomeView(brand: brand)
            }
            Tab("Customers", image: "IconCustomers", value: .customers) {
                CustomersView()
            }
            Tab("Orders", image: "IconOrders", value: .orders) {
                OrdersView(brand: brand)
            }
            Tab("Collection", image: "IconCollection", value: .collection) {
                CollectionView(brand: brand, mode: .collection,
                               floatingPosition: .constant(.zero)) {}
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .toolbarVisibility(.visible, for: .tabBar)
    }
}
