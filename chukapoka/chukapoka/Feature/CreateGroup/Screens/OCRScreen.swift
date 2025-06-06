//
//  OCRScreen.swift
//  chukapoka
//
//  Created by jenki on 6/6/25.
//

import SwiftUI
import PhotosUI

struct InvitationOCRScreen: View {
    @State private var selectedItem: PhotosPickerItem?
    @StateObject private var viewModel: SelectImageViewModel

    init(viewModel: SelectImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            ImagePickerSectionView(selectedItem: $selectedItem)

            .onChange(of: selectedItem) {
                guard let item = selectedItem else { return }

                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        viewModel.handleImageSelection(image)
                    }
                }
            }

            if let image = viewModel.selectedImage {
                ImagePreviewView(image: image)
            }

            if let result = viewModel.ocrResult {
                OCRResultView(result: result)
            }
        }
        .padding()
        .navigationTitle("청첩장 인식")
    }
}
