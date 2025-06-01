//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep1View: View {
    @StateObject private var viewModel: GroupCreateViewModel
    
    init(viewModel: GroupCreateViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("정보 입력 1단계")
            Button("다음") {
                viewModel.didTapNext()
            }
        }
        .navigationTitle("그룹 생성1")
    }
}
