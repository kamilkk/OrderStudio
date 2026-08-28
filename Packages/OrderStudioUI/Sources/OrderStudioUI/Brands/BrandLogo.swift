import SwiftUI

/// A procedural monogram logo: brand initials on a tinted rounded tile.
struct BrandLogo: View {
    let name: String
    let tint: Color
    var dimmed: Bool = false // used for "not synchronized" state

    private var initials: String {
        let parts = name.split(separator: " ")
        let letters = parts.prefix(2).compactMap { $0.first }
        return String(letters).uppercased()
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(tint.gradient)
            .overlay {
                Text(initials)
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
            }
            .overlay(alignment: .bottomLeading) {
                Text(name)
                    .font(.caption).bold()
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(8)
            }
            .saturation(dimmed ? 0 : 1)
            .opacity(dimmed ? 0.25 : 1)
            .accessibilityElement()
            .accessibilityLabel(Text(name))
    }
}
