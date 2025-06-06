//
//  CreateGroupView.swift
//  chukapoka
//
//  Created by jenki on 6/5/25.
//

import SwiftUI
import PhotosUI

struct SelectImageView: View {
    @State private var selectedItem: PhotosPickerItem?
    @StateObject private var viewModel: SelectImageViewModel
    
    init(viewModel: SelectImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
        }
    }
}
