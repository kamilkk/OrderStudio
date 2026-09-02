//
//  PreviewData.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

#if DEBUG
    import OrderStudioCore
    import SwiftUI

    /// Shared sample data for SwiftUI previews. DEBUG-only — never compiled into release.
    enum PreviewData {
        static let brand = StoreBrand(name: "Veloce", asset: "Veloce")

        /// Literal Veloce accent (#E4572E). Package-level previews can't reliably resolve the
        /// app target's asset catalog via `Bundle.main`, so pass this to `tint:` parameters
        /// instead of `brand.tint` to guarantee the right color in isolated previews.
        static let tint = Color(red: 0xE4 / 255.0, green: 0x57 / 255.0, blue: 0x2E / 255.0)

        static var customer: Customer { Customer.sampleCustomers[0] }
        static var stats: CustomerStats { customer.stats }
        static var orders: [Order] { (1 ... 4).map { Order.random(name: "Order \($0)") } }
    }
#endif
