//
//  Calculation.swift
//  Count1Day_swiftUI
//
//  Created by 浦山秀斗 on 2023/06/25.
//
import SwiftUI

class Calculation: ObservableObject {
    @Published var computeNumber: Int?
    @Published var computedNumber: Int?
    @Published var resultNumber: Int?
    @Published var mode: CalculatorMode?
    
    func addition() {
        guard let unwrapComputeNumber = computeNumber else { return }
        guard let unwrapComputedNumber = computedNumber else { return }
        resultNumber = unwrapComputeNumber + unwrapComputedNumber;
    }
    
    func subtraction() {
        guard let unwrapComputeNumber = computeNumber else { return }
        guard let unwrapComputedNumber = computedNumber else { return }
        resultNumber = unwrapComputeNumber - unwrapComputedNumber;
    }
    
    func multiplication() {
        guard let unwrapComputeNumber = computeNumber else { return }
        guard let unwrapComputedNumber = computedNumber else { return }
        resultNumber = unwrapComputeNumber * unwrapComputedNumber;
    }
    
    func division() {
        guard let unwrapComputeNumber = computeNumber else { return }
        guard let unwrapComputedNumber = computedNumber else { return }
        resultNumber = unwrapComputeNumber / unwrapComputedNumber;
    }
    
    func equal() {
        guard let unwrapMode = mode else { return }
        
        switch unwrapMode {
        case CalculatorMode.addition:
            addition()
        case CalculatorMode.subtraction:
            subtraction()
        case CalculatorMode.multiplication:
            multiplication()
        case CalculatorMode.division:
            division()
        }
    }
    
    func clear() {
        computeNumber  = nil
        computedNumber = nil
        resultNumber   = nil
        mode = nil
    }
}

enum CalculatorMode {
    case addition
    case subtraction
    case multiplication
    case division
}
