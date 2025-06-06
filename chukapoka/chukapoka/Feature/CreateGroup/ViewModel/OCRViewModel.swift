//
//  SelectImageViewModel.swift
//  chukapoka
//
//  Created by jenki on 6/5/25.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
final class SelectImageViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var ocrResult: OCRResult?
    @Published var recognizedTextLines: [String] = []

    private let ocrManager = OCRManager()
    private let textClassifier = TextClassifier()

    func handleImageSelection(_ image: UIImage) {
        self.selectedImage = image
        ocrManager.recognizeText(from: image) { [weak self] lines in
            guard let self = self else { return }
            Task { @MainActor in
                self.recognizedTextLines = lines
                self.ocrResult = self.textClassifier.classify(lines)
            }
        }
    }
}
