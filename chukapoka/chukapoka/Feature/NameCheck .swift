//
//  NameCheck .swift
//  chukapoka
//
//  Created by 김소원 on 6/4/25.
//
//


import SwiftUI

struct NameCheck: View {
    @State private var teamName: String = "경조사실무팀"

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            (
                           Text("모임명\n") +
                           Text(teamName)
                               .foregroundStyle(GSColor.primary) +
                           Text(" 으로 축의할까요?")
                       )
                       .font(GSFont.title2)
                       .lineSpacing(12)
                       .foregroundStyle(GSColor.black)
                       .padding(.top, 57)
        
            Spacer()

            PrimaryButton(
              title: "다음",
              style: .custom(textColor: GSColor.white, backgroundColor: GSColor.primary, isEnable: true),
              action: { print("다음 클릭") }
            )
            .padding(.bottom, 30)
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    NameCheck()
}
