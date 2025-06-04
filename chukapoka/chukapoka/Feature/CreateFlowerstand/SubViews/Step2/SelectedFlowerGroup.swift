//
//  SelectedFlowerGroup.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct SelectedFlowerGroup: View {
    var selectedFlower: String
    
    // 개별 꽃의 위치 데이터를 배열로 저장
    let flowerOffsets: [CGSize] = [
        CGSize(width: -6.5, height: -49),
        CGSize(width: -34.5, height: -22),
        CGSize(width: 5.5, height: -6),
        CGSize(width: -28.5, height: 20)
    ]
    
    var body: some View {
        ZStack {
            ForEach(0..<flowerOffsets.count, id: \.self) { index in
                Image(selectedFlower)
                    .resizable()
                    .frame(width: 26, height: 27)
                    .offset(flowerOffsets[index])
            }
        }
        .frame(width: 69, height: 98)
    }
}
