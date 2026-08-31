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
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    // Portrait / narrow: blurred fill behind the fitted art (nothing crops).
                    if geo.size.width / geo.size.height < 4.0 / 3.0 {
                        brand.splashImage
                            .resizable().scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .blur(radius: 40)
                            .clipped()
                    }
                    // Wide (landscape): fill edge-to-edge — only trims top/bottom, so the
                    // horizontal wordmark is never cut. Narrow (portrait): fit on the blur.
                    brand.splashImage
                        .resizable()
                        .aspectRatio(contentMode: geo.size.width / geo.size.height >= 4.0 / 3.0 ? .fill : .fit)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.backward")
                            .fontWeight(.semibold)
                            .padding(8)
                            .background(.thinMaterial, in: .circle)
                    }
                    .accessibilityLabel("Back to Brands")
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}
