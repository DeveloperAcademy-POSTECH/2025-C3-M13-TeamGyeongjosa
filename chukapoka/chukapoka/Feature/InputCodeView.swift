//
//  InputCodeView.swift
//  chukapoka
//
//  Created by 김소원 on 6/4/25.
//

import SwiftUI

struct InputCodeView: View {
    @State private var code: String = ""
    @State private var isCodeValid: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            (
                Text("참여를 위해\n") +
                Text("모임 코드")
                    .foregroundStyle(GSColor.primary) +
                Text("를 입력해주세요")
            )
            .font(GSFont.title2)
            .lineSpacing(12)
            .foregroundStyle(GSColor.black)
            .padding(.top, 57)
            
            
            CodeInputField(
                placeholder: "모임 코드를 입력해주세요",
                text: $code,
                isValid: isCodeValid,
                errorMessage: "6자리 영문 대문자 또는 숫자로 입력해주세요"
            )
            .onChange(of: code) {
                code = code.uppercased()

                let pattern = "^[A-Z0-9]{6}$"
                do {
                    let regex = try NSRegularExpression(pattern: pattern)
                    let range = NSRange(location: 0, length: code.utf16.count)
                    let match = regex.firstMatch(in: code, options: [], range: range)
                    isCodeValid = (match != nil)
                } catch {
                    isCodeValid = false
                }
            }
            .padding(.top, 24)
            
            Spacer()
            
            PrimaryButton(
                title: "다음",
                style: isCodeValid ? .basic : .disabled,
                action: {
                    print("입력한 코드: \(code)")
                }
            )
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InputCodeView()
}
