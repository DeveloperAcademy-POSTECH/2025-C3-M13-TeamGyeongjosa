//
//  FlowerStandStep2ViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/6/25.
//

import SwiftUI

final class FlowerStandStep2ViewModel: ObservableObject {
    
    @Published var selectedColor: Color = GSColor.yellow
    @Published var selectedFlower: String = "YellowFlower"
    
    func selectColor(_ color: Color) {
        selectedColor = color
    }
    
    func selectFlower(_ flowerName: String) {
        selectedFlower = flowerName
    }
    
    var isValid: Bool {
        return !selectedFlower.isEmpty
    }
}
