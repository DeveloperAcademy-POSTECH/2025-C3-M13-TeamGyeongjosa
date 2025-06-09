//
//  NameCheck .swift
//  chukapoka
//
//  Created by 김소원 on 6/4/25.
//
//

import SwiftUI

struct NameCheckView: View {
    @ObservedObject var viewModel: EnterGroupViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            (
                Text("모임명\n") +
                Text(viewModel.teamName)
                    .foregroundStyle(GSColor.primary) +
                Text(" 으로 축의할까요?")
            )
            .font(GSFont.title2)
            .lineSpacing(12)
            .foregroundStyle(GSColor.black)
            .padding(.top, 57)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
