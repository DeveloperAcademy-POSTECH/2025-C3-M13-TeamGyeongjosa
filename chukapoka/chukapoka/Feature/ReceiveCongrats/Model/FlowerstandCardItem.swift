//
//  FlowerstandCardItem.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//
import SwiftUI
import Foundation

struct FlowerstandCardItem: Identifiable {
    // 화환 이미지 저장 기능 구현 후 이미지로 대체
    let id = UUID()
    let name: String
    let backgroundColor: Color
    
    static func sampleData() -> [FlowerstandCardItem] {
        [
            FlowerstandCardItem(name: "데미안", backgroundColor: GSColor.primary),
            FlowerstandCardItem(name: "유우", backgroundColor: GSColor.secondary1),
            FlowerstandCardItem(name: "모세", backgroundColor: GSColor.secondary2),
            FlowerstandCardItem(name: "젠키", backgroundColor: GSColor.secondary3),
            FlowerstandCardItem(name: "웨이", backgroundColor: GSColor.yellow),
            FlowerstandCardItem(name: "위시", backgroundColor: GSColor.pink)
        ]
    }

}
