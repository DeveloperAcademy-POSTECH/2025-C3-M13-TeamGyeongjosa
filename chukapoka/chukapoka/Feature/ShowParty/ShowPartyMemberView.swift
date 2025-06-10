//
//  ShowPartyMemberView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct ShowPartyMemberView: View {
    @ObservedObject var viewModel: ShowPartyMemberViewModel
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBar {
                    viewModel.goBack()
                }
                
                ShowPartyNameView(partyName: viewModel.partyName)
                
                let noMoneyMembers = viewModel.membersWithoutMoney()
                
                if let leader = noMoneyMembers.leader {
                    ShowPartyCardView(
                        leader: leader,
                        participants: noMoneyMembers.participants,
                        onMemberTapped: { tappedMember in
                            viewModel.selectedMember = tappedMember
                        }
                    )
                    .padding(.top, 24)
                    .padding(.horizontal, 16)
                }
                
                Spacer()
            }
            
            if let selected = viewModel.selectedMember {
                let parsed = viewModel.parseFlowerstandPath(selected.flowerstandPath)
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.selectedMember = nil
                    }
                
                FinishFlowerstandCard(
                    selectedColor: parsed.color,
                    selectedFlower: parsed.flower,
                    partyName: viewModel.partyName,
                    ribbonText: selected.message
                )
                .transition(.scale)
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: viewModel.selectedMember)
    }
}
