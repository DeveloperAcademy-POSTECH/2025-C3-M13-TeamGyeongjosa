//
//  OCRResultView.swift
//  chukapoka
//
//  Created by jenki on 6/8/25.
//

// TODO: 값만 InfoStep1View 로 보내도록 수정 -> 뒤로가기 이슈 고려
// TODO: 값만 InfoStep2View 로 보냈을 때 -> 뒤로가기 이슈 고려

import SwiftUI

struct OCRResultView: View {
    @ObservedObject var viewModel: CreateGroupViewModel
    @ObservedObject var ocrViewModel: OCRViewModel
    @Binding var currentStep: InvitationOCRView.OCRStep
    
    // OCR 결과를 받아와 텍스트 필드에 반영할 State 변수
    @State private var place: String = ""
    @State private var date: String = ""
    @State private var time: String = ""
    @State private var bride: String = ""
    
    var onNext: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar {
                //ocrviewModel.goToPreviousStep()
                currentStep = .photoPicker
            }
            CustomProgressView(progress: viewModel.progressRate)
                .padding(.bottom, 30)
            ZStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        Text("입력된 정보가 정확한지 \n 다시 한 번 확인해주세요")
                            .font(GSFont.title2)
                            .foregroundColor(GSColor.black)
                        CustomTextField(
                            title: "모임명",
                            placeholder: "어떤 모임에서 화환을 전달하나요?",
                            text: $viewModel.partyName,
                            isValid: $viewModel.isPartyNameValid
                        )
                        CustomTextField(
                            title: "결혼식 장소",
                            placeholder: "결혼식 장소를 입력해주세요",
                            text: $place,
                            isValid: $viewModel.isPlaceValid
                        )
                        CustomTextField(
                            title: "결혼식 날짜",
                            placeholder: "YYYY. MM. DD",
                            text: $date,
                            isValid: $viewModel.isDateValid
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.weddingDate) {
                            viewModel.weddingDate = viewModel.formatDateInput(viewModel.weddingDate)
                        }
                        CustomTextField(
                            title: "결혼식 시간",
                            placeholder: "HH:MM",
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
            .padding(.horizontal, 16)
            .animation(.easeInOut, value: viewModel.currentStep)
            
            @Environment(\.modelContext) var modelContext
            PrimaryButton(
                title: viewModel.nextButtonTitle,
                style: viewModel.isNextButtonEnabled ? .basic : .disabled,
                action: {
                    // TODO: SwiftData와 확인 필요
                    viewModel.handleNext(modelContext: modelContext)
                    onNext()
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        //.navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.endTextEditing()
        }
        .onAppear {
            if let result = ocrViewModel.ocrResult {
                place = result.place ?? ""
                date = result.date ?? ""
                time = result.time ?? ""
                
                viewModel.weddingPlace = place
                viewModel.weddingDate = viewModel.formatDateInput(date)
                viewModel.weddingTime = viewModel.formatTimeInput(time)
                
                if let bride = result.brideName {
                    viewModel.receiverName = bride
                }
            }
        }
    }
}
