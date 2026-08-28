//
//  HomeView.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import ModernDesignSystem
import OrderStudioCore
import SwiftUI

struct HomeView: View {
    let brand: StoreBrand
    @State private var showSettings = false
    @State private var showSync = false

    var body: some View {
        ZStack {
            brand.splashImage
                .resizable().scaledToFill()
                .ignoresSafeArea() // per-brand hero art

            VStack {
                Spacer()
                HStack {
                    Button { showSettings = true } label: {
                        Image(systemName: "gearshape").font(.title2)
                    }
                    .accessibilityLabel("Settings") // a11y fix
                    Spacer()
                    Text("Last sync: 2d ago").foregroundStyle(.secondary)
                    Button {
                        showSync = true
                    } label: {
                        Label { Text("Synchronize now") } icon: { Image("IconSync") }
                    }
                    .buttonStyle(ModernButtonStyle(type: .primary, size: .medium)) // MDS button
                }
                .padding()
                .background(.thinMaterial, in: .capsule)
                .padding(30)
            }
        }
        .sheet(isPresented: $showSettings) { SettingsView() }
        .fullScreenCover(isPresented: $showSync) {
            CollectionRefreshView(isPresenting: $showSync)
        }
    }
}
