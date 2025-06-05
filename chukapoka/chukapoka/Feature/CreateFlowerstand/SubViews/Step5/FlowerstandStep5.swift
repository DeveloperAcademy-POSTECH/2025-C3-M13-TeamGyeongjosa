//
//  FlowerstandStep5.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep5: View {
    @State var name: String = "강지수"
    
    var body: some View {
        VStack(alignment: .center, spacing: 155) {
            Text("\(name)님 만의\n진심이 담긴 화환이 준비되었어요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    FlowerstandStep5()
}
