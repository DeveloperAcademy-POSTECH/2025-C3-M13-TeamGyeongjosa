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
            InputCodeHeaderView()
            
            InputCodeFieldView(code: $code, isCodeValid: $isCodeValid)
                .padding(.top, 24)
            
            Spacer()
            
            InputCodeButtonView(code: code, isCodeValid: isCodeValid)
                .padding(.bottom, 30)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InputCodeView()
}
