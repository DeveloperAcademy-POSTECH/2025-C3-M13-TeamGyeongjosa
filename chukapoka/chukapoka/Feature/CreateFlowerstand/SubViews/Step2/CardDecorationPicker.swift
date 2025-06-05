//
//  CardDecorationPicker.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct CardDecorationPicker: View {
    @Binding var selectedColor: Color
    @Binding var selectedFlower: String
    
    let circleColors: [Color] = [
        GSColor.yellow,
        GSColor.purple,
        GSColor.pink
    ]
    
    let flowerNames: [String] = [
        "YellowFlower",
        "BlueFlower",
        "RedFlower"
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 11) {
            HStack(spacing: 13) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(selectedColor == circleColors[index] ? circleColors[index] : GSColor.white)
                        .stroke(selectedColor == circleColors[index] ? GSColor.primary : GSColor.gray1, lineWidth: 1)
                        .frame(width: 42, height: 42)
                        .overlay(
                            Circle()
                                .fill(circleColors[index])
                                .frame(width: 34, height: 34))
                        .onTapGesture {
                            selectedColor = circleColors[index]
                        }
                }
            }
            
            HStack(spacing: 11) {
                ForEach(0..<3, id: \.self) { index in
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 77, height: 55)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(selectedFlower == flowerNames[index] ? GSColor.primary : GSColor.gray1, lineWidth: 1)
                        )
                        .overlay(
                            Image(flowerNames[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        )
                        .onTapGesture {
                            selectedFlower = flowerNames[index]
                        }
                }
            }
        }
    }
}
