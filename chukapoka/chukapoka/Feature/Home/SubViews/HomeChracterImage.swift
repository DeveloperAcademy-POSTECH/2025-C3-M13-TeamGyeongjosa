//
//  HomeChracterImage.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct HomeChracterImage: View {
    var body: some View {
        GSImage.mainLogo
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}
