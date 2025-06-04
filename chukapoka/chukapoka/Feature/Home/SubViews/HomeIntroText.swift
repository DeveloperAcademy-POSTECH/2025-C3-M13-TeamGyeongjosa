//
//  HomeIntroText.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct HomeIntroText: View {
    var body: some View {
        Text("멤버를 초대하고\n함께 축하해보세요")
            .multilineTextAlignment(.center)
            .font(GSFont.title2)
            .foregroundColor(GSColor.black)
    }
}
