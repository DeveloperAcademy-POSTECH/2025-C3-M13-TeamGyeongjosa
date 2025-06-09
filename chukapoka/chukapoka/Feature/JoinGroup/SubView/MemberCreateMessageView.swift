//
//  MemberCreateMessageView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct MemberCreateMessageView: View {
    @ObservedObject var viewModel: MemberJoinViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("화환에 들어갈 문구를\n작성해주세요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundColor(GSColor.black)
                .padding(.bottom, 39)
            
            CreateRibbonMessage(text: viewModel.bindingMessage)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(
            GSImage.messageRibbon
        )
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
