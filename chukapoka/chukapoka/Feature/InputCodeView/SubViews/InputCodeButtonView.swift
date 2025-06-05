//
//  InputCodeButtonView.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//
import SwiftUI

struct InputCodeButtonView: View {
    let code: String
    let isCodeValid: Bool

    var body: some View {
        PrimaryButton(
            title: "다음",
            style: isCodeValid ? .basic : .disabled,
            action: {
                print("입력한 코드: \(code)")
            }
        )
    }
}
