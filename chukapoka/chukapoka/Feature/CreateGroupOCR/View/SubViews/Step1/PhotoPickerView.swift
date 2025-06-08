
//
//  ImagePickerView.swift
//  chukapoka
//
//  Created by jenki on 6/6/25.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @ObservedObject var ocrViewModel: OCRViewModel
    @StateObject private var viewModel: CreateGroupViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var isPickerPresented = false
    
    init(viewModel: CreateGroupViewModel, ocrViewModel: OCRViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.ocrViewModel = ocrViewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // MARK: - 툴바 (뒤로가기)
            NavigationBar {
                viewModel.goToPreviousStep()
            }
            //            CustomProgressView(progress: viewModel.progressRate)
            .padding(.bottom, 30)
            // MARK: - 청첩장 불러오기 설명
            Text("화환을 함께 전달하기 위해\n몇 가지 정보를 수집할게요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundStyle(GSColor.black)
            Text("청첩장 이미지를 불러오면 시간이 단축돼요")
                .font(GSFont.caption2)
                .foregroundStyle(GSColor.gray2)
            Spacer()
            // MARK: - 청첩장 불러오기 버튼
            PrimaryButton(
                title: "청첩장 불러오기",
                style: .basic,
                action: {
                    isPickerPresented = true
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        // MARK: - PhotosPicker 와 .onChange
        .photosPicker(
            isPresented: $isPickerPresented,
            selection: $ocrViewModel.selectedItem,
            matching: .images
        )
        .onChange(of: ocrViewModel.selectedItem) { newItem in
            guard let newItem else { return }
            ocrViewModel.handleImageSelection(from: newItem) {
                coordinator.push(.invitationOCR)
            }
        }
    }
}
