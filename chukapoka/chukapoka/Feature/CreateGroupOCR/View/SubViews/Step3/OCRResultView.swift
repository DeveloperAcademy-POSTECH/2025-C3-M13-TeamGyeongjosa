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
    @Environment(\.modelContext) var modelContext
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
        NavigationBar {
            viewModel.goToPreviousStep()
        }
        CustomProgressView(progress: 0.6).padding(.bottom, 30)

        VStack(spacing: 0) {
            ZStack{
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        Text("입력된 정보가 정확한지 \n다시 한 번 확인해주세요")
                            .font(GSFont.title2)
                            .lineSpacing(12)
                            .foregroundColor(GSColor.black)
                        CustomTextField(
                            title: "받는 분",
                            placeholder: "화환을 받는 분의 이름을 입력해주세요",
                            text: $viewModel.receiverName,
                            isValid: $viewModel.isReceiverNameValid
                        )
                        CustomTextField(
                            title: "은행",
                            placeholder: "모바일 청첩장에 있는 은행을 알려주세요",
                            text: $viewModel.receiverBank,
                            isValid: $viewModel.isReceiverBankValid
                        )
                        
                        CustomTextField(
                            title: "계좌번호",
                            placeholder: "모바일 청첩장에 있는 계좌번호를 알려주세요",
                            text: $viewModel.receiverAccount,
                            isValid: $viewModel.isReceiverAccountValid
                        )
                        .keyboardType(.numberPad)
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
                        Text("결혼식 D-day에 맞춰 모인 축의금이 자동으로 송금돼요!")
                            .font(GSFont.caption2)
                            .foregroundStyle(GSColor.gray1)
                            .frame(maxWidth: .infinity, alignment: .center)
                        .onChange(of: viewModel.weddingTime) {
                            viewModel.weddingTime = viewModel.formatTimeInput(viewModel.weddingTime)
                        }
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 16)
            .animation(.easeInOut, value: viewModel.currentStep)
            
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
        .navigationBarBackButtonHidden(true)
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
