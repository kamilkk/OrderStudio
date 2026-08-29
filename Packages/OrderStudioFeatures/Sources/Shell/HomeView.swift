//
//  HomeView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import OrderStudioCore
import SwiftUI

struct HomeView: View {
    let brand: StoreBrand
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        brand.splashImage
            .resizable().scaledToFill()
            .ignoresSafeArea() // per-brand hero art
            .overlay(alignment: .topLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.backward").font(.headline)
                }
                .padding(12)
                .background(.thinMaterial, in: .circle)
                .padding(24)
                .accessibilityLabel("Back to Brands")
            }
    }
}
