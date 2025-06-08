////
////  OCRResultView.swift
////  chukapoka
////
////  Created by jenki on 6/8/25.
////
//
//struct OCRResultView: View {
//    @ObservedObject var ocrViewModel: OCRViewModel
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 24) {
//                if let image = ocrViewModel.selectedImage {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: .infinity)
//                        .overlay(
//                            VStack(alignment: .leading) {
//                                ForEach(ocrViewModel.recognizedTextLines, id: \.self) { line in
//                                    Text(line)
//                                        .font(.body)
//                                        .foregroundColor(.red)
//                                        .background(.yellow.opacity(0.3)) // 밑줄 느낌
//                                }
//                            }
//                            .padding(),
//                            alignment: .bottomLeading
//                        )
//                }
//
//                Button("다음으로") {
//                    // ex: 다음 단계로 이동
//                }
//                .padding()
//            }
//            .padding()
//        }
//    }
//}
