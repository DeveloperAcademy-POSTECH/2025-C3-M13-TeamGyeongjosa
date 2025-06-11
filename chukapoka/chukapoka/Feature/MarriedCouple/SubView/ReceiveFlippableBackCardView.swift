//
//  ReceiveFlippableBackCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveFlippableBackCardView: View {
    let party: Party
    let height: CGFloat
    
    var body: some View {
        let sortedMembers = party.members.sorted {
            if $0.isLeader != $1.isLeader {
                return $0.isLeader && !$1.isLeader
            } else {
                return $0.name < $1.name
            }
        }
        let leader = sortedMembers.first(where: { $0.isLeader })
        let participants = sortedMembers.filter { !$0.isLeader }
        
        VStack {
            if let leader = leader {
                ShowPartyCardView(
                    leader: leader,
                    participants: participants
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}
