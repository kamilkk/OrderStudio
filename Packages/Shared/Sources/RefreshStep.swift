//
//  RefreshStep.swift
//  Shared
//
//  Created by Kamil Kowalski on 28/08/2026.
//

import Foundation

public enum RefreshStep: String, Codable, CaseIterable, Equatable {
    case brands, products, orders, stocks
}
