//
//  CustomBackBar.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/6/25.
//

import SwiftUI

struct NavigationBar: View {
    let onBack: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onBack()
            }) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12)
                    .foregroundColor(GSColor.black)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
