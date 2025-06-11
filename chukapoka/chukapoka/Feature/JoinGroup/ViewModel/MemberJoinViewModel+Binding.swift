//
//  MemberJoinViewModel+Binding.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

extension MemberJoinViewModel {
    // MARK: - Account Parsing Helpers
    func parseAccount(_ account: String) -> (bank: String, number: String)? {
        let components = account.split(separator: " ", maxSplits: 1).map { String($0) }
        guard components.count == 2 else { return nil }
        return (bank: components[0], number: components[1])
    }

    func composeAccount(bank: String, number: String) -> String {
        return "\(bank) \(number)"
    }

    // MARK: - Setters
    func updateSenderBankAndNumberFromState() {
        if let parsed = parseAccount(state.accountNumber) {
            senderBank = parsed.bank
            senderAccountNumber = parsed.number
        }
    }

    func updateAccountFromSenderBankAndNumber() {
        let composed = composeAccount(bank: senderBank, number: senderAccountNumber)
        send(.updateAccount(composed))
    }

    // MARK: - 바인딩 (텍트 입력)
    var bindingSenderName: Binding<String> {
        Binding(
            get: { self.state.name },
            set: { self.send(.updateName($0)) }
        )
    }
    
    var bindingSenderPhone: Binding<String> {
        Binding(
            get: { self.state.phoneNumber },
            set: { newValue in
                self.send(.updatePhone(newValue))
            }
        )
    }
    
    var bindingSenderBankName: Binding<String> {
        Binding(
            get: { self.senderBank },
            set: {
                self.senderBank = $0
                self.updateAccountFromSenderBankAndNumber()
            }
        )
    }

    var bindingSenderAccountNumber: Binding<String> {
        Binding(
            get: { self.senderAccountNumber },
            set: {
                self.senderAccountNumber = $0
                self.updateAccountFromSenderBankAndNumber()
            }
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
    
    var bindingIsSenderBankNameValid: Binding<Bool> {
        Binding(
            get: { !self.state.bankName.isEmpty },
            set: { _ in }
        )
    }
    
    var bindingIsSenderAccountNumberValid: Binding<Bool> {
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
