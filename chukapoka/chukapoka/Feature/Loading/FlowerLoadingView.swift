//
//  FlowerstandStep5.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerLoadingView: View {
    @ObservedObject var viewModel: FlowerLoadingViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 155) {
            Text("포키가 화환을 배달하고 있어요\n조금만 기다려주세요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            Image("FinishCreatePoki")
        }
    }
}
