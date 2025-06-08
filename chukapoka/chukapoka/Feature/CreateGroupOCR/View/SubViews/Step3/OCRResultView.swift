//
//  OCRResultView.swift
//  chukapoka
//
//  Created by jenki on 6/8/25.
//

import SwiftUI

struct OCRResultView: View {
    @ObservedObject var ocrViewModel: OCRViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 선택된 이미지 표시
                if let image = ocrViewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                }

                // 인식된 텍스트 표시
                if !ocrViewModel.recognizedTextLines.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("인식된 텍스트")
                            .font(.headline)

                        // MARK: - OCR 결과 출력
                        if let result = ocrViewModel.ocrResult {
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
//
//                        ForEach(ocrViewModel.recognizedTextLines, id: \.self) { line in
//                            Text("• \(line)")
//                                .font(.body)
//                                .padding(.vertical, 4)
//                                .padding(.horizontal, 8)
//                                .background(Color.yellow.opacity(0.2))
//                                .cornerRadius(5)
//                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                }

                
                // 다음 단계로 이동 버튼
                Button("다음으로") {
                    // coordinator.push(.nextStep) 등으로 다음 라우트 이동
                }
                .padding()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
