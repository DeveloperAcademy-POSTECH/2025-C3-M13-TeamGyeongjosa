//
//  SelectImageViewModel.swift
//  chukapoka
//
//  Created by jenki on 6/5/25.
//

import SwiftUI
import PhotosUI

@MainActor
final class OCRViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? = nil
    @Published var selectedImage: UIImage? = nil
    @Published var recognizedTextLines: [String] = []

    private let ocrManager = OCRManager()

    func processSelectedItem() async {
        guard let item = selectedItem else { return }
        
        // Step 1: UIImage로 변환
        if let data = try? await item.loadTransferable(type: Data.self),
           let image = UIImage(data: data) {
            self.selectedImage = image
            
            // Step 2: OCR 처리
            ocrManager.recognizeText(from: image) { [weak self] lines in
                Task { @MainActor in
                    self?.recognizedTextLines = lines
                }
            }
        }
    }
}
