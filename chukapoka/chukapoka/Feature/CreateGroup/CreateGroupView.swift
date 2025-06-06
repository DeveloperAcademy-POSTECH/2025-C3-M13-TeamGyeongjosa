//
//  CreateGroupView.swift
//  chukapoka
//
//  Created by jenki on 6/5/25.
//


import SwiftUI
import PhotosUI

struct CreateGroupView: View {
    @StateObject private var viewModel = SelectImageViewModel()
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - 이미지 선택
            PhotosPicker("📸 청첩장 이미지 선택", selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) { newItem in
                    guard let item = newItem else { return }

                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            viewModel.handleImageSelection(image)
                        }
                    }
                }

            // MARK: - 선택한 이미지 미리보기
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
            }

            // MARK: - OCR 결과 출력
            if let result = viewModel.ocrResult {
                VStack(alignment: .leading, spacing: 8) {
                    Text("👰 신부: \(result.brideName ?? "인식 실패")")
                    Text("🤵 신랑: \(result.groomName ?? "인식 실패")")
                    Text("📅 날짜: \(result.date ?? "인식 실패")")
                    Text("📍 장소: \(result.place ?? "인식 실패")")
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
        }
        .padding()
        .navigationTitle("그룹 생성")
    }
}
