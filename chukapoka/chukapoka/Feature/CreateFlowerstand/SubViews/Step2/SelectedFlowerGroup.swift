//
//  SelectedFlowerGroup.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct SelectedFlowerGroup: View {
    var selectedFlower: String
    var containerWidth: CGFloat
    var containerHeight: CGFloat

    // 기준 크기
    let baseWidth: CGFloat = 69
    let baseHeight: CGFloat = 98

    // 비율 기반 offset
    var relativeOffsets: [CGSize] {
        [
            CGSize(width: -6.5 / baseWidth, height: -49 / baseHeight),
            CGSize(width: -34.5 / baseWidth, height: -22 / baseHeight),
            CGSize(width: 5.5 / baseWidth, height: -6 / baseHeight),
            CGSize(width: -28.5 / baseWidth, height: 20 / baseHeight)
        ]
    }

    var body: some View {
        ZStack {
            ForEach(0..<relativeOffsets.count, id: \.self) { index in
                let offset = relativeOffsets[index]
                Image(selectedFlower)
                    .resizable()
                    .frame(width: containerWidth * 0.35, height: containerHeight * 0.27)
                    .offset(
                        x: containerWidth * offset.width,
                        y: containerHeight * offset.height
                    )
            }
        }
        .frame(width: containerWidth, height: containerHeight)
    }
}
