//
//  FlowerstandAmountViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/6/25.
//
import SwiftUI

final class FlowerStandStep1ViewModel: ObservableObject {
    @Published var amountText: String = ""
    
    var amount: Int? {
        Int(amountText.filter(\.isNumber))
    }
    
    var isValid: Bool {
        if let value = amount {
            return value > 0
        }
        return false
    }
}
