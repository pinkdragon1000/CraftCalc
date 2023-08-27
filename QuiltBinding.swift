//  CalculatorView.swift
//  Created by Sita Robinson on 8/27/23.
//  Math from: https://melaniekham.com/the-best-machine-binding-method/
import SwiftUI

struct QuiltBinding: View {
    @State private var fabricLength: Double = 0;
    @State private var fabricWidth: Double = 0;
    @State private var joinSelection = 1
    
    var body: some View {
        VStack {
            Form {
                Text("Fabric Dimensions")
                HStack{
                    TextField("Length", value: $fabricLength, formatter: NumberFormatter()).frame(width: 110)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Text("x")
                    
                    TextField("Width", value: $fabricWidth, formatter: NumberFormatter()).frame(width: 110)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .fixedSize(horizontal: true, vertical: false)
                }
                
                let totalInches = 2 * fabricLength + 2 * fabricWidth;
                let addCornersAndJoin = totalInches + 10;
                
                if(fabricLength != 0 && fabricWidth != 0) {
                    Picker(selection: $joinSelection, label: Text("Join Type")) {
                        Text("Bias Join").tag(1)
                        Text("Straight Join").tag(2)
                    }
                    
                    //38 if bias or 40 for straight
                    let widthOfFabric: Double = joinSelection == 1 ? 38 : 40;
                    let numStrips = ceil(addCornersAndJoin / widthOfFabric);
                    let yardage = numStrips * 2.5;
                    
                    
                    Text("Cut \(Int(numStrips)) binding strips, 2.5 inches wide.  These \(Int(numStrips)) strips will be cut from \(String(format: "%.2f", yardage)) inches of fabric.")
                }
            }
        }.navigationBarTitle("Quilt Binding Calc")
    }
    }
