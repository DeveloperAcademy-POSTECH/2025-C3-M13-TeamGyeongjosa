//
//  FlowerstandCardView.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//
import SwiftUI

struct FlowerstandCardView: View {
    var selectedColor: Color
    var selectedFlower: String
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 235, height: 301)
                .background(selectedColor)
                .cornerRadius(16)
                .overlay(
                    Image("BaseFlowerstand")
                )
                .overlay(
                    SelectedFlowerGroup(selectedFlower: selectedFlower)
                        .offset(x: 15, y: 15)
                )
            
        }
    }
}
