//
//  RightText.swift
//  chukapoka
//
//  Created by 조유진 on 6/5/25.
//

import SwiftUI

struct RightText: View {
    var ribbonText: String
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(ribbonText), id: \.self) { char in
                Text(String(char))
                    .font(GSFont.caption3)
                    .foregroundColor(GSColor.white)
            }
        }
        .rotationEffect(Angle(degrees: -23.5))
    }
}
