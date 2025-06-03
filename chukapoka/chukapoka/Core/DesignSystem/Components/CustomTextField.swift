//
//  CustomTextField.swift
//  chukapoka
//
//  Created by 조유진 on 6/2/25.
//
import SwiftUI

struct CustomTextField: View {
    let title: String
    let infoText: String?
    let placeholder: String
    @Binding var text: String
    let action: (() -> Void)?
    @Binding var isValid: Bool
    
    init(
        title: String,
        infoText: String? = nil,
        placeholder: String,
        text: Binding<String>,
        action: (() -> Void)? = nil,
        isValid: Binding<Bool>,
    ) {
        self.title = title
        self.infoText = infoText
        self.placeholder = placeholder
        self._text = text
        self.action = action
        self._isValid = isValid
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 0) {
                Text(title)
                    .font(GSFont.body2)
                    .foregroundColor(GSColor.black)
                if let info = infoText {
                    Text(info)
                        .font(GSFont.body2)
                        .foregroundColor(GSColor.gray1)
                }
            }
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(GSColor.gray3)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                }
                
                TextField("", text: $text, onEditingChanged: { isEditing in
                    if isEditing {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isValid = true
                        }
                    }
                    action?()
                })
                .accentColor(GSColor.primary)
                .padding()
                
            }
            .onChange(of: text) {
                if !isValid {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isValid = true
                    }
                }
            }
            .background(GSColor.secondary3)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isValid ? Color.clear : Color.red, lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity, minHeight: 52, alignment: .topLeading)
    }
}

#Preview {
    // 한글 입력만 받을 수 있도록 예외처리 하는 예시 프리뷰입니다.
    struct PreviewWrapper: View {
        @State private var inputText: String = ""
        @State private var isValid: Bool = true  // 상태를 외부에서 관리
        
        var body: some View {
            VStack(spacing: 16) {
                CustomTextField(
                    title: "받을 분",
                    infoText: "(신랑 혹은 신부)", // 없으면 작성하지 않아도 되는 부분
                    placeholder: "어떤 파티에서 화환을 전달하나요?",
                    text: $inputText,
                    isValid: $isValid
                )
                
                Button("확인") {
                    // 버튼 누를 때 검사
                    isValid = inputText.range(of: #"[\u{AC00}-\u{D7AF}]"#, options: .regularExpression) != nil
                }
            }
            .padding()
        }
    }
    return PreviewWrapper()
}
