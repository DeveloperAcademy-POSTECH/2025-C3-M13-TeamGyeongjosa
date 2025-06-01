//
//  EnterCodeView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct EnterCodeView: View {
    var body: some View {
        VStack {
            Text("참여 코드 입력")
            TextField("코드를 입력하세요", text: .constant(""))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
        .padding()
        .navigationTitle("코드 입력")
    }
}
