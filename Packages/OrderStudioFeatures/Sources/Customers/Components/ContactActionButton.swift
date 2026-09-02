//
//  ContactActionButton.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import SwiftUI

struct ContactActionButton: View {
    let icon: String // "IconPhone" / "IconEmail" / "IconMapPin"
    let title: String // "Call" / "Email" / "Map"
    let tint: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(icon)
                    .renderingMode(.template)
                    .resizable().scaledToFit().frame(width: 20, height: 20)
                    .foregroundStyle(tint)
                Text(title).font(.caption).foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color(.secondarySystemGroupedBackground), in: .rect(cornerRadius: 12))
            .overlay { RoundedRectangle(cornerRadius: 12).stroke(.quaternary, lineWidth: 1) }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }
}

#if DEBUG
    #Preview {
        HStack(spacing: 12) {
            ContactActionButton(icon: "IconPhone", title: "Call", tint: PreviewData.tint) {}
            ContactActionButton(icon: "IconEmail", title: "Email", tint: PreviewData.tint) {}
            ContactActionButton(icon: "IconMapPin", title: "Map", tint: PreviewData.tint) {}
        }
        .padding()
    }
#endif
