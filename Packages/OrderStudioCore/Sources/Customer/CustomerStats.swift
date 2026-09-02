//
//  CustomerStats.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import Foundation

public struct MonthlyOrders: Identifiable, Hashable, Codable, Sendable {
    public let label: String // "Jan", "Feb", …
    public let count: Int
    public var id: String { label } // stable within the trailing 8 months
    public init(label: String, count: Int) { self.label = label; self.count = count }
}

public struct CustomerStats: Hashable, Codable, Sendable {
    public let lifetimeSpend: Decimal
    public let spendYoYPercent: Int // +12 → "↑ 12% YoY"
    public let totalOrders: Int
    public let openOrders: Int
    public let closedOrders: Int
    public let avgOrder: Decimal
    public let avgOrderDeltaPercent: Int // +4  → "↑ 4%"
    public let onTimePercent: Int // 92  → "92%"
    public let fulfilledCount: Int // 46  → "46 fulfilled"
    public let monthly: [MonthlyOrders] // 8 trailing months; last = current
}
