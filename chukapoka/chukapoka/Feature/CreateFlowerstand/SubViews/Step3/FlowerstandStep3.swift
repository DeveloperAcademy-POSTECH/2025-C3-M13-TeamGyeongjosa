//
//  FlowerstandStep3.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep3: View {
    @State private var text: String = ""

    var isValidMessage: Bool {
        !text.isEmpty && text.count <= 10
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            GSImage.messageRibbon
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 39) {
                Text("화환에 들어갈 문구를\n작성해주세요")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                
                Spacer()
                
                CreateRibbonMessage(text: $text)
                
                PrimaryButton(title: "다음",
                              style: isValidMessage ? .basic : .disabled)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FlowerstandStep3()
}
