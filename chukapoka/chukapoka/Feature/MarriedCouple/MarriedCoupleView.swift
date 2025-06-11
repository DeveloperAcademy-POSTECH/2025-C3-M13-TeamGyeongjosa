//
//  MarriedCoupleView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct MarriedCoupleView: View {
    
    @ObservedObject var viewModel: MarriedCoupleViewModel
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationBar {
                viewModel.goBack()
            }
            MarriedCoupleMainTextView()
            
            ReceiveCardContainerView(
                parties: viewModel.parties,
                currentIndex: $currentIndex
            )
            
            Spacer()
            
            PrimaryButton(
                title: "해당 모임의 화환 보러가기",
                style: .custom(
                    textColor: GSColor.primary,
                    backgroundColor: GSColor.secondary3,
                    isEnable: true),
                action: {
                    guard viewModel.parties.indices.contains(currentIndex) else { return }
                    let selectedParty = viewModel.parties[currentIndex]
                    viewModel.goToReceiveCardList(party: selectedParty)
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    MarridCoupleView()
}
