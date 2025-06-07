////
////  InvitationOCRView.swift
////  chukapoka
////
////  Created by jenki on 6/8/25.
////
//
//import SwiftUI
//
//struct InvitationOCRView: View {
//    @ObservedObject var ocrviewModel: OCRViewModel
//    @EnvironmentObject var coordinator: AppCoordinator
//    @StateObject private var viewModel: CreateGroupViewModel
//    
//    
//    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
//        self.ocrviewModel = ocrviewModel
//        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
//    }
////    
////    var body: some View {
////        VStack {
////            
////            ImagePickerView(viewModel: viewModel, createGroupViewModel: <#CreateGroupViewModel#>, ocrviewModel: ocrviewModel)
//////            ImagePickerView(viewModel: viewModel, createGroupViewModel: <#CreateGroupViewModel#>, ocrviewModel: ocrviewModel)
////           
////            if let image = ocrviewModel.selectedImage {
////                Image(uiImage: image)
////                    .resizable()
////                    .scaledToFit()
////                    .frame(height: 200)
////            }
////
////            if !ocrviewModel.recognizedTextLines.isEmpty {
////                List(ocrviewModel.recognizedTextLines, id: \.self) { line in
////                    Text(line)
////                }
////
////                Button("다음으로") {
////                    coordinator.push(.loadingInfoDone)
////                }
////                .padding()
////            }
////        }
////        .padding()
////    }
//}
