import ModernDesignSystem
import SwiftUI

/// The Order Studio brandmark: a monogram tile (+ optional wordmark),
/// reused across the app icon, launch screen and Home hero.
struct OrderStudioMark: View {
    var showsWordmark: Bool = true
    private let brandTint = Color(hex: 0x1F6FEB) // cobalt

    var body: some View {
        VStack(spacing: 16) {
            RoundedRectangle(cornerRadius: 44, style: .continuous)
                .fill(brandTint.gradient)
                .overlay {
                    Image(systemName: "bag.fill")
                        .font(.system(size: 120, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .frame(width: 220, height: 220)
                .shadow(radius: 12)

            if showsWordmark {
                Text("Order Studio")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Order Studio")
    }
}
