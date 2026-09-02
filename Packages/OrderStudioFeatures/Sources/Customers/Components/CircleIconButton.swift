//
//  CircleIconButton.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import SwiftUI

struct CircleIconButton: View {
    let icon: String // asset name, e.g. "IconShare" / "IconAdd"
    var filled = false // filled = brand tint bg + white glyph
    let tint: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(icon)
                .renderingMode(.template)
                .resizable().scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundStyle(filled ? Color.white : tint)
                .frame(width: 40, height: 40)
                .background(
                    filled ? AnyShapeStyle(tint) : AnyShapeStyle(.background),
                    in: .circle
                )
                .overlay { if !filled { Circle().stroke(.quaternary, lineWidth: 1) } }
        }
        .buttonStyle(.plain)
    }
}
