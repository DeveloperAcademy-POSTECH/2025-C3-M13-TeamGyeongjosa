//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep1View: View {
    // MARK: - ViewModel
    @ObservedObject var viewModel: CreateGroupViewModel
    
    // MARK: - View Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("화환을 함께 전달하기 위해 \n몇 가지 정보를 수집할게요")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                
                CustomTextField(
                    title: "모임명",
                    placeholder: "어떤 파티에서 화환을 전달하나요?",
                    text: $viewModel.partyName,
                    isValid: $viewModel.isPartyNameValid
                )
                
                CustomTextField(
                    title: "결혼식 장소",
                    placeholder: "결혼식 장소를 입력해주세요",
                    text: $viewModel.weddingPlace,
                    isValid: $viewModel.isPlaceValid
                )
                
                CustomTextField(
                    title: "결혼식 날짜",
                    placeholder: "ex) 2025.12.25",
                    text: $viewModel.weddingDate,
                    isValid: $viewModel.isDateValid
                )
                .keyboardType(.numberPad)
                .onChange(of: viewModel.weddingDate) {
                    viewModel.weddingDate = viewModel.formatDateInput(viewModel.weddingDate)
                }
                
                CustomTextField(
                    title: "결혼식 시간",
                    placeholder: "ex) 12:00",
                    text: $viewModel.weddingTime,
                    isValid: $viewModel.isTimeValid
                )
                .keyboardType(.numberPad)
                .onChange(of: viewModel.weddingTime) {
                    viewModel.weddingTime = viewModel.formatTimeInput(viewModel.weddingTime)
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}
