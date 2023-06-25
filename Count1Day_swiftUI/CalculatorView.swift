//
//  CalculatorView.swift
//  Count1Day_swiftUI
//
//  Created by 浦山秀斗 on 2023/06/25.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var calculation: Calculation
    
    var body: some View {
        HStack {
            VStack {
                NumberButton(number: 7, calculation: calculation)
                NumberButton(number: 4, calculation: calculation)
                NumberButton(number: 1, calculation: calculation)
                MethodButton(methodName: "C", method: { calculation.clear() })
            }
            VStack {
                NumberButton(number: 8, calculation: calculation)
                NumberButton(number: 5, calculation: calculation)
                NumberButton(number: 2, calculation: calculation)
                MethodButton(methodName: "=", method: { calculation.equal() })
            }
            VStack {
                NumberButton(number: 9, calculation: calculation)
                NumberButton(number: 6, calculation: calculation)
                NumberButton(number: 3, calculation: calculation)
                MethodButton(methodName: "÷", method: { calculation.mode = CalculatorMode.division })
            }
            VStack {
                MethodButton(methodName: "+", method: { calculation.mode = CalculatorMode.addition })
                MethodButton(methodName: "-", method: { calculation.mode = CalculatorMode.subtraction })
                MethodButton(methodName: "×", method: { calculation.mode = CalculatorMode.multiplication })
                MethodButton(methodName: "÷", method: { calculation.mode = CalculatorMode.division })
            }
        }
    }
}

struct NumberButton: View {
    let number: Int
    @ObservedObject var calculation: Calculation
    
    var body: some View {
        Button(action: {
            if calculation.computeNumber != nil {
                calculation.computedNumber = number
            } else {
                calculation.computeNumber  = number
            }
        }, label: {
            Text("\(number)")
                .frame(width: 70, height: 70)
                .background(Color.red)
                .foregroundColor(Color.white)
        })
    }
}

struct MethodButton: View {
    var methodName: String
    var method: () -> Void

    var body: some View {
        Button(action: {
            method()
        }, label: {
            Text("\(methodName)")
                .frame(width: 70, height: 70)
                .background(Color.red)
                .foregroundColor(Color.white)
        })
    }
}
