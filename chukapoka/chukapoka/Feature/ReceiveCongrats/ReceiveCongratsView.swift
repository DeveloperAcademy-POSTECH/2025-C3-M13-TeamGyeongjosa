//
//  ReceiveCongratsView.swift
//  chukapoka
//
//  Created by 조유진 on 6/6/25.
//

import SwiftUI

struct ReceiveCongratsView: View {
    @StateObject var viewModel: ReceiveCongratsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            ReceiveCongratsCardContainer()

            PrimaryButton(title: "해당 파티의 화환 보러가기")
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
        .environmentObject(viewModel)
    }
}
