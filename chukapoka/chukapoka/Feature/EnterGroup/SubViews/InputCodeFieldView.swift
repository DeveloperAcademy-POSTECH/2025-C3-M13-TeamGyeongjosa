//
//  InputCodeFieldView.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//
import SwiftUI

struct InputCodeFieldView: View {
    @Binding var code: String
    @Binding var isCodeValid: Bool
    @Binding var isCodeMatched: Bool
    
    var body: some View {
        
        let isFinalValid = isCodeValid && isCodeMatched
        
        let errorMessage: String? = {
            if !isCodeValid {
                return "6자리 영문 대문자 또는 숫자로 입력해주세요"
            } else if !isCodeMatched {
                return "일치하는 모임 코드가 없어요"
            } else {
                return nil
            }
        }()
        
        CodeInputField(
            placeholder: "모임 코드를 입력해주세요",
            text: $code,
            isValid: isFinalValid,
            errorMessage: errorMessage
        )
        .onChange(of: code) {
            code = code.uppercased()
            
            let pattern: String = "^[A-Z0-9]{6}$"
            do {
                let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern)
                let range: NSRange = NSRange(location: 0, length: code.utf16.count)
                let match: NSTextCheckingResult? = regex.firstMatch(in: code, options: [], range: range)
                isCodeValid = (match != nil)
                isCodeMatched = true
            } catch {
                isCodeValid = false
                isCodeMatched = false
            }
        }
    }
}
