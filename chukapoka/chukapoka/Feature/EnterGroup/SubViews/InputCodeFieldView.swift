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

    var body: some View {
        CodeInputField(
            placeholder: "모임 코드를 입력해주세요",
            text: $code,
            isValid: isCodeValid,
            errorMessage: "6자리 영문 대문자 또는 숫자로 입력해주세요"
        )
        .onChange(of: code) {
            code = code.uppercased()

            let pattern: String = "^[A-Z0-9]{6}$"
            do {
                let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern)
                let range: NSRange = NSRange(location: 0, length: code.utf16.count)
                let match: NSTextCheckingResult? = regex.firstMatch(in: code, options: [], range: range)
                isCodeValid = (match != nil)
            } catch {
                isCodeValid = false
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var code: String = ""
        @State private var isCodeValid: Bool = false

        var body: some View {
            InputCodeFieldView(code: $code, isCodeValid: $isCodeValid)
                .padding(.horizontal, 16)
        }
    }

    return PreviewWrapper()
}
