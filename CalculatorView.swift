//  CalculatorView.swift
//  Created by Sita Robinson on 8/27/23.
import SwiftUI

struct CalculatorView: View {
    let calculatorSelected: String

    var body: some View {
        if (calculatorSelected == "Quilt Binding") {
            QuiltBinding();
        }
        
        else {
            Text("Selected calculator: \(calculatorSelected)")
                .font(.largeTitle)
        }
    }
}
