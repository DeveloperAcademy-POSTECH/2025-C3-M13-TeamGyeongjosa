//
//  CodeInputField.swift
//  chukapoka
//
//  Created by 김소원 on 6/4/25.
// 컴포넌트 보고 만든 거

import SwiftUI

struct CodeInputField: View {
    let placeholder: String
    @Binding var text: String
    let isValid: Bool
    let errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(GSColor.gray3)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                }

                TextField("", text: $text)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.characters)
                    .accentColor(GSColor.primary)
                    .padding()
            }
            .background(GSColor.secondary3)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke((text.isEmpty || isValid) ? Color.clear : Color.red, lineWidth: 1)
            )
            .frame(maxWidth: .infinity, minHeight: 52)

            if let error = errorMessage, !text.isEmpty && !isValid {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading, 4)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var text: String = ""
        @State private var isValid: Bool = true
        
        var body: some View {
            VStack(spacing: 16) {
                CodeInputField(
                    placeholder: "모임 코드를 입력해주세요",
                    text: $text,
                    isValid: isValid,
                    errorMessage: "6자리 영문 대문자와 숫자 조합이어야 해요"
                )
                .padding(.horizontal, 16)

                Button("유효성 확인") {
                    let pattern: String = "^[A-Z0-9]{6}$"
                    if text.range(of: pattern, options: .regularExpression) != nil {
                        isValid = true
                    } else {
                        isValid = false
                    }
                }
            }
        }
    }

    return PreviewWrapper()
}
