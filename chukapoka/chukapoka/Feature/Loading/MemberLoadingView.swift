//
//  MemberLoadingView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//
import SwiftUI

struct MemberLoadingView: View {
    @ObservedObject var viewModel: MemberLoadingViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 155) {
            Text("포키가 화환을 배달하고 있어요\n조금만 기다려주세요")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            Image("FinishCreatePoki")
        }
    }
}
