//
//  ShowPartyMemberView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct ShowPartyMemberView: View {
    @StateObject private var viewModel: ShowPartyMemberViewModel
    @State private var selectedMember: PartyMember? = nil
    
    init(viewModel: ShowPartyMemberViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar {
                viewModel.goBack()
            }
            Text(viewModel.party.name)
                .font(GSFont.title1)
                .foregroundColor(GSColor.black)
                .padding(.top, 30)
            
            PartyCardDetailContainerView(
                party: viewModel.party,
                onSelect: { member in
                    selectedMember = member
                }
            )
        }
        .overlay {
            if let selected = selectedMember {
                ShowPartyFlowers(
                    member: selected,
                    onDismiss: {
                        selectedMember = nil
                    }
                )
            }
        }
    }
}
