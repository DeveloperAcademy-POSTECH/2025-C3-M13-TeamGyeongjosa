//
//  ImagePickerView.swift
//  chukapoka
//
//  Created by jenki on 6/6/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    @Binding var selectedItem: PhotosPickerItem?

    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()
        ) {
            HStack {
                Image(systemName: "photo")
                Text("청첩장 이미지 선택")
            }
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
    }
}
