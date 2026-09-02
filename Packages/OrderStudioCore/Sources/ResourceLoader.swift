//
//  ResourceLoader.swift
//  OrderStudioCore
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import Foundation

public enum ResourceLoader {
    /// Decode a JSON resource bundled in this package (`Bundle.module`). Used to seed
    /// fake data today; swap the implementation for a real persistence layer later —
    /// call sites stay the same.
    public static func decode<T: Decodable>(_ name: String, as _: T.Type = T.self) -> T {
        // `Bundle.module` is internal, so it's referenced here in the body rather than
        // as a public default argument (which the compiler rejects).
        guard let url = Bundle.module.url(forResource: name, withExtension: "json") else {
            fatalError("Missing bundled resource \(name).json in \(Bundle.module)")
        }
        do {
            return try JSONDecoder().decode(T.self, from: Data(contentsOf: url))
        } catch {
            fatalError("Failed to decode \(name).json: \(error)")
        }
    }
}
