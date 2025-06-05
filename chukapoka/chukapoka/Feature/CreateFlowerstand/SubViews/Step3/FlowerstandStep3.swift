//
//  FlowerstandStep3.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep3: View {
    @State private var text: String = ""
    @State private var isValid: Bool = true
    
    var body: some View {
        ZStack(alignment: .leading) {
            GSImage.messageRibbon
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 39) {
                Text("화환에 들어갈 문구를\n작성해주세요")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                
                Spacer()
                
                CreateRibbonMessage()
                
                PrimaryButton(title: "다음", style: .basic)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    FlowerstandStep3()
}
