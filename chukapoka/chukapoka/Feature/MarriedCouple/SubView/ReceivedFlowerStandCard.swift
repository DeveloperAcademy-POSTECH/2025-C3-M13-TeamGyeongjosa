//
//  FlowerStandCard.swift
//  chukapoka
//
//  Created by 조유진 on 6/11/25.
//

import SwiftUI

struct ReceivedFlowerStandCard: View {
    var selectedColor: Color
    var selectedFlower: String
    var width: CGFloat = 117.5
    var height: CGFloat = 150
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: width, height: height)
                .background(selectedColor)
                .cornerRadius(16)
                .overlay(
                    Image("BaseFlowerstand")
                        .resizable()
                        .frame(width: width-10, height: height)
                )
                .overlay(
                    SelectedFlowerGroup(
                        selectedFlower: selectedFlower,
                        containerWidth: width * 0.3,
                        containerHeight: height * 0.32
                    )
                    .offset(x: 6, y: 0)
                )
        }
    }
}
