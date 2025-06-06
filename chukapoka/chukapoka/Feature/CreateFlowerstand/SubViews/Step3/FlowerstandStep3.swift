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
        ZStack(alignment: .leading) {
            GSImage.messageRibbon
                .scaledToFit()
            // TODO: - 리본위에 실시간 데이터 반영되게
            VStack(alignment: .leading, spacing: 39) {
                Text("화환에 들어갈 문구를\n작성해주세요")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                
                Spacer()
                
                CreateRibbonMessage(text: $viewModel.message)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FlowerstandStep3(viewModel: FlowerStandStep3ViewModel())
}
