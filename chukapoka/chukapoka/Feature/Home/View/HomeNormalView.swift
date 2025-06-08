//
//  HomeNormalView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//
import SwiftUI

struct HomeNormalView: View {
    var body: some View {
        VStack {
            HomeChracterImage()
                .padding(.top, 57)
            HomeIntroText()
                .padding(.top, 57)
        }
    }
}
