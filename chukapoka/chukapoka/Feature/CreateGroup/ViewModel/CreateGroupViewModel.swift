//
//  GroupCreateViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import Foundation
import SwiftUI

@MainActor
final class CreateGroupViewModel: ObservableObject {
    @Published var name: String = ""
    
    // View가 처리
    func didTapNext() {
        print("다음 단계로 이동 요청")
    }
}
