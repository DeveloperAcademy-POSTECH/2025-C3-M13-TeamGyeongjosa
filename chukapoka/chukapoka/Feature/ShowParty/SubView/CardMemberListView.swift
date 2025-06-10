//
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct CardMemberListView: View {
    let members: [PartyMember]
    let onSelect: (PartyMember) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !members.isEmpty {
                Text("참여자(\(members.count)명)")
                    .font(GSFont.body1)
                    .foregroundColor(GSColor.white)
            }

            CardMemberListScrollView(members: members, onSelect: onSelect)
        }
    }
}
