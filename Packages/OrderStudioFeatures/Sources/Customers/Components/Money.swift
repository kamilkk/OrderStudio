//
//  Money.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import Foundation

enum Money {
    // No decimals in the mockup tiles ($48,240 / $754). Adjust locale/currency as needed.
    static func string(_ value: Decimal) -> String {
        value.formatted(.currency(code: "USD").precision(.fractionLength(0)))
    }
}
