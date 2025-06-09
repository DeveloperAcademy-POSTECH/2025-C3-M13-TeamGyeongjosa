//
//  MemberJoinViewModel+Binding.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

extension MemberJoinViewModel {
    // MARK: - 바인딩 (텍스트 입력)
    var bindingSenderName: Binding<String> {
        Binding(
            get: { self.state.name },
            set: { self.send(.updateName($0)) }
        )
    }
    
    var bindingSenderPhone: Binding<String> {
        Binding(
            get: { self.state.phoneNumber },
            set: { self.send(.updatePhone($0)) }
        )
    }
    
    var bindingSenderAccount: Binding<String> {
        Binding(
            get: { self.state.accountNumber },
            set: { self.send(.updateAccount($0)) }
        )
    }
    
    var bindingAmountText: Binding<String> {
        Binding(
            get: { self.state.amountText },
            set: {
                let filtered = $0.filter(\.isNumber)
                self.send(.updateAmount(String(filtered.prefix(4))))
            }
        )
    }
    
    var bindingSelectedColor: Binding<Color> {
        Binding(
            get: { self.state.selectedColor },
            set: { self.send(.updateColor($0)) }
        )
    }
    
    var bindingSelectedFlower: Binding<String> {
        Binding(
            get: { self.state.selectedFlower },
            set: { self.send(.updateFlower($0)) }
        )
    }
    
    var bindingMessage: Binding<String> {
        Binding(
            get: { self.state.message },
            set: {
                let limited = String($0.prefix(10))
                self.send(.updateMessage(limited))
            }
        )
    }
    
    // MARK: - 바인딩 (유효성 검사)
    var bindingIsSenderNameValid: Binding<Bool> {
        Binding(
            get: { self.isValidKoreanName(self.state.name) },
            set: { _ in }
        )
    }
    
    var bindingIsSenderPhoneValid: Binding<Bool> {
        Binding(
            get: { self.isValidPhone(self.state.phoneNumber) },
            set: { _ in }
        )
    }
    
    var bindingIsSenderAccountValid: Binding<Bool> {
        Binding(
            get: { !self.state.accountNumber.isEmpty },
            set: { _ in }
        )
    }
    
    var bindingIsAmountValid: Binding<Bool> {
        Binding(
            get: {
                if let amount = self.state.amount {
                    return amount > 0
                }
                return false
            },
            set: { _ in }
        )
    }
    
    var bindingIsMessageValid: Binding<Bool> {
        Binding(
            get: { !self.state.message.isEmpty && self.state.message.count <= 10 },
            set: { _ in }
        )
    }
}
