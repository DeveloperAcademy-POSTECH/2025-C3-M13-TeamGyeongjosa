//
//  LeftText.swift
//  chukapoka
//
//  Created by 조유진 on 6/5/25.
//

import SwiftUI

struct LeftText: View {
    var partyName: String

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(partyName), id: \.self) { char in
                Text(String(char))
                    .font(GSFont.body2)
                    .foregroundColor(GSColor.white)
            }
        }
        .rotationEffect(Angle(degrees: 23))
    }
}
