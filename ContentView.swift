//  ContentView.swift
//  Created by Sita Robinson on 8/27/23.

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    let calculators = [
        "Quilt Binding",
        "Blah"
    ]

    var body: some View {
        NavigationStack {
            List(calculators, id: \.self) { calculator in
                NavigationLink(calculator, value: calculator)
            }
            .navigationDestination(for: String.self, destination: CalculatorView.init)
            .navigationTitle("Select a Calculator")
        }
    }
}
