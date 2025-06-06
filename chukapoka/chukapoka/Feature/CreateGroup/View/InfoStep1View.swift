//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep1View: View {
    @ObservedObject var viewModel: CreateGroupViewModel
    
    var body: some View {
        VStack {
            Text("정보 입력 1단계")
            Button("다음") {
                viewModel.coordinator.push(.createFlowerstand)
            }
        }
        .navigationTitle("그룹 생성1")
    }
}
