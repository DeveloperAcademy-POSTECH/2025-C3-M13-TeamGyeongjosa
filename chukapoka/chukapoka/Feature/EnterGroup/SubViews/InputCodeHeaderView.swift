//
//  InputCodeHeaderView .swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//
import SwiftUI

struct InputCodeHeaderView: View {
    var body: some View {
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
    }
}

#Preview {
    InputCodeHeaderView()
        .padding(.horizontal, 16)
}
