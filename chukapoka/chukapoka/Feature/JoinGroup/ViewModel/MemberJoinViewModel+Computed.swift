//
//  MemberJoinViewModel+Computed.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

// 추가할 컴퓨티드 프로퍼티들 (Binding 외 모든 것)
extension MemberJoinViewModel {
    
    // Step 정보
    var step: MemberJoinStep {
        state.step
    }
    
    var amount: Int? {
        state.amount
    }
    
    var senderName: String {
        state.name
    }
    
    var partyName: String {
        party.name
    }
    
    var selectedColor: Color {
        state.selectedColor
    }
    
    var selectedFlower: String {
        state.selectedFlower
    }
    
    var message: String {
        state.message
    }
    
    // 유효성 검사
    var isSenderNameValid: Bool {
        isValidKoreanName(state.name)
    }
    
    var isSenderPhoneValid: Bool {
        isValidPhone(state.phoneNumber)
    }
    
    var isSenderAccountValid: Bool {
        !state.accountNumber.isEmpty
    }
    
    var isAmountValid: Bool {
        if let amount = state.amount {
            return amount > 0
        }
        return false
    }
    
    var isMessageValid: Bool {
        !state.message.isEmpty && state.message.count <= 10
    }
}
