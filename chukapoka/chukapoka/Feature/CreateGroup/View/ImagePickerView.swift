
//
//  ImagePickerView.swift
//  chukapoka
//
//  Created by jenki on 6/6/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    @ObservedObject var ocrViewModel: OCRViewModel
    @StateObject private var viewModel: CreateGroupViewModel

    init(viewModel: CreateGroupViewModel, ocrViewModel: OCRViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.ocrViewModel = ocrViewModel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                // MARK: - 툴바 (뒤로가기)
                NavigationBar {
                    viewModel.goToPreviousStep()
                }
                CustomProgressView(progress: viewModel.progressRate)
                    .padding(.bottom, 30)
                //MARK: - 청첩장 불러오기
                Text("화환을 함께 전달하기 위해\n몇 가지 정보를 수집할게요")
                    .font(GSFont.title2)
                    .lineSpacing(12)
                    .foregroundStyle(GSColor.black)

                Text("청첩장 이미지를 불러오면 시간이 단축돼요")
                    .font(GSFont.caption2)
                    .foregroundStyle(GSColor.gray2)
            }
            .padding(.horizontal, 4)
            .padding(.top, 32)

            Spacer()
            
            PrimaryButton(
                title: viewModel.nextButtonTitle,
                style: viewModel.isNextButtonEnabled ? .basic : .disabled,
                action: {
                    viewModel.handleNext()
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
