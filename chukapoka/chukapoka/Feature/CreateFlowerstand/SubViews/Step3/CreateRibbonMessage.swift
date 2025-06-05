//
//  CreateRibbonMessage.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct CreateRibbonMessage: View {
    @State private var text: String = ""
    @State private var isValid: Bool = true

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text("문구를 10자 이내로 작성해주세요")
                    .foregroundColor(GSColor.gray3)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
            }
            
            TextField("", text: $text, onEditingChanged: { isEditing in
                if isEditing {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isValid = true
                    }
                }
            })
            .accentColor(GSColor.primary)
            .padding(12)
            .onChange(of: text) {
                if text.count > 10 {
                    text = String(text.prefix(10))
                }
                if !isValid {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isValid = true
                    }
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
}

#Preview {
    CreateRibbonMessage()
}
