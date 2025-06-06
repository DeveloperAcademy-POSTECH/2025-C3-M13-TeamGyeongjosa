//
//  FlowerStandStep3ViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/6/25.
//

import SwiftUI

final class FlowerStandStep3ViewModel: ObservableObject {
    @Published var message: String = ""
        
    var isValid: Bool {
        !message.isEmpty && message.count <= 10
    }
}
