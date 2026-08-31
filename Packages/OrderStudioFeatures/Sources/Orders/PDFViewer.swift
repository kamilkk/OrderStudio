//
//  PDFViewer.swift
//  OrderStudioFeatures
//
//  Created by Kamil Kowalski on 31/08/2026.
//

import PDFKit
import SwiftUI

struct PDFViewer: View {
    let url: URL? = Bundle.main.url(forResource: "sample-order", withExtension: "pdf")

    var body: some View {
        if let url {
            PDFKitView(url: url).navigationTitle("Order PDF")
        } else {
            ContentUnavailableView("No document", systemImage: "doc.text.magnifyingglass")
                .navigationTitle("Order PDF")
        }
    }
}

private struct PDFKitView: UIViewRepresentable {
    let url: URL
    func makeUIView(context _: Context) -> PDFView {
        let view = PDFView()
        view.document = PDFDocument(url: url)
        view.autoScales = true
        return view
    }

    func updateUIView(_: PDFView, context _: Context) {}
}
