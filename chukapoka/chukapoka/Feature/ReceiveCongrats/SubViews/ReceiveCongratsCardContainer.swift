//
//  ReceiveCongratsCardContainer.swift
//  chukapoka
//
//  Created by 조유진 on 6/6/25.
//

import SwiftUI

struct ReceiveCongratsCardContainer: View {
    @EnvironmentObject var viewModel: ReceiveCongratsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("화환이 도착했어요!")
                .font(GSFont.title2)
            Text("카드를 누르면 명단을 볼 수 있어요")
                .font(GSFont.caption2)
        }
        .padding(.top, 78)
        .padding(.bottom, 42)
        
        ReceiveCongratsCardFlipView()
    }
}
