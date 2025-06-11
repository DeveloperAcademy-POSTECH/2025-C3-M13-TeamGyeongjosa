//
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct MarriedCoupleMainTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("화환이 도착했어요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
            Text("카드를 누르면 명단을 볼 수 있어요")
                .font(GSFont.caption2)
                .foregroundColor(GSColor.gray2)
        }
        .padding(.leading, 16)
        .padding(.top, 24)
    }
}
