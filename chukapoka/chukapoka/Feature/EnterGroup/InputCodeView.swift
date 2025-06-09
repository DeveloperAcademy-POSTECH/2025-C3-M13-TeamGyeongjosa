//
//  InputCodeView.swift
//  chukapoka
//
//  Created by 김소원 on 6/4/25.
//
import SwiftUI

struct InputCodeView: View {
    @ObservedObject var viewModel: EnterGroupViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            InputCodeHeaderView()
            
            InputCodeFieldView(
                code: $viewModel.code,
                isCodeValid: $viewModel.isCodeValid
            )
            .padding(.top, 24)
            
            Spacer()
            
            
                .onTapGesture {
                    self.endTextEditing()
                }
        }
    }
}
