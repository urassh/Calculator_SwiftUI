//
//  ContentView.swift
//  Count1Day_swiftUI
//
//  Created by 浦山秀斗 on 2023/06/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calculation = Calculation()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Spacer()
                if let unwrapResultNumber = calculation.resultNumber {
                    Text("\(unwrapResultNumber)")
                        .font(.largeTitle)
                } else if let unwrapComputedNumber = calculation.computedNumber {
                    Text("\(unwrapComputedNumber)")
                        .font(.largeTitle)
                } else if let unwrapComputeNumber = calculation.computeNumber {
                    Text("\(unwrapComputeNumber)")
                        .font(.largeTitle)
                } else {
                    Text("0")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                CalculatorView(calculation: calculation)

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
