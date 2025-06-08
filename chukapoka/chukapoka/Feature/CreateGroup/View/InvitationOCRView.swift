//
//  InvitationOCRView.swift
//  chukapoka
//
//  Created by jenki on 6/8/25.
//

import SwiftUI

struct InvitationOCRView: View {
    @ObservedObject var ocrviewModel: OCRViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel: CreateGroupViewModel
    
    
    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
        self.ocrviewModel = ocrviewModel
        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        VStack {
            // 청첩장 이미지 + 버튼
            ImagePickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)
            
            // OCR 결과가 있을 경우 표시
            if let image = ocrviewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            
            if !ocrviewModel.recognizedTextLines.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("인식된 텍스트")
                        .font(.headline)
                    ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
                        Text("• \(line)")
                            .font(.body)
                    }
                    
                    Button("다음으로") {
                        coordinator.push(.loadingInfoDone)
                    }
                    .padding(.top, 12)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}
