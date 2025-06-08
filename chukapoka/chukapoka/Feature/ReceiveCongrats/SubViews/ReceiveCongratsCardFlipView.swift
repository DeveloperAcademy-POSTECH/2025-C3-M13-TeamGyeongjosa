//
//  ReceiveCongratsCardFlipView.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct ReceiveCongratsCardFlipView: View {
    @EnvironmentObject var viewModel: ReceiveCongratsViewModel
    @State private var isFlipped = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isFlipped {
                    ReceiveCongratsCardBackView(
                        leader: viewModel.leader,
                        members: viewModel.members,
                        height: geometry.size.height
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                } else {
                    ReceiveCongratsCardFrontView(
                        groupName: viewModel.groupName,
                        weddingDate: viewModel.weddingDate,
                        weddingPlace: viewModel.weddingPlace,
                        height: geometry.size.height
                    )
                }
            }
            .rotation3DEffect(
                .degrees(isFlipped ? -180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.easeInOut, value: isFlipped)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isFlipped.toggle()
                }
            }
        }
    }
}

struct ReceiveCongratsCardFlipView_Previews: PreviewProvider {
    static let vm = ReceiveCongratsViewModel.mock()

    static var previews: some View {
        ReceiveCongratsCardFlipView()
            .environmentObject(vm)
    }
}
