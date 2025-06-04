//
//  FlowerstandStep4.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep4: View {
    var body: some View {
        VStack(alignment: .center, spacing: 155) {
            Text("화환을 제작 중이에요\n조금만 기다려주세요")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            Image("FinishCreatePoki")
        }
    }
}

#Preview {
    FlowerstandStep4()
}
