//
//  AddressCard.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 02/09/2026.
//

import MapKit
import OrderStudioCore
import SwiftUI

struct AddressCard: View {
    let customer: Customer
    let tint: Color

    private var coordinate: CLLocationCoordinate2D {
        .init(latitude: customer.latitude, longitude: customer.longitude)
    }

    private var region: MKCoordinateRegion {
        .init(center: coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }

    var body: some View {
        SectionCard(title: "Address") {
            HStack(alignment: .top, spacing: 16) {
                Text(customer.addressFormatted)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 0)
                Map(initialPosition: .region(region)) {
                    Annotation(customer.city, coordinate: coordinate) {
                        Image("IconMapPin")
                            .renderingMode(.template)
                            .foregroundStyle(tint) // brand-tinted pin
                    }
                }
                .frame(width: 150, height: 96)
                .clipShape(.rect(cornerRadius: 12))
                .allowsHitTesting(false)
            }
        }
    }
}

#if DEBUG
    #Preview {
        AddressCard(customer: PreviewData.customer, tint: PreviewData.tint).padding()
    }
#endif
