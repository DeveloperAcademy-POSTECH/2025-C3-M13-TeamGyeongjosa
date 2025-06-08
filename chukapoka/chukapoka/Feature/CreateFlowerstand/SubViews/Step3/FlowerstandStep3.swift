//
//  FlowerstandStep3.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep3: View {
    @ObservedObject var viewModel: FlowerStandStep3ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("화환에 들어갈 문구를\n작성해주세요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundColor(GSColor.black)
                .padding(.bottom, 39)
            
            CreateRibbonMessage(text: $viewModel.message)
            
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

#Preview {
    FlowerstandStep3(viewModel: FlowerStandStep3ViewModel())
}
