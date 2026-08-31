//
//  CategoryRow.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import OrderStudioCore
import SwiftUI

struct CategoryRow: View {
    let category: ProductCategory

    var body: some View {
        if let subs = category.subcategories, !subs.isEmpty {
            DisclosureGroup(category.name) {
                ForEach(subs) { CategoryRow(category: $0) }
            }
        } else {
            Text(category.name)
        }
    }
}
