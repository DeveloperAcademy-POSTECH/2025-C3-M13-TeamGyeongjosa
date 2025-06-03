//
//  PaymentInput.swift
//  chukapoka
//
//  Created by 김소원 on 6/3/25.
//

import SwiftUI

struct PaymentInputView: View {

    var body: some View {
        VStack(spacing: 24) {
            Button("🎉 그룹 만들기") {
                coordinator.push(.groupCreate(.infoStep1))
            }
        }
    }
}
