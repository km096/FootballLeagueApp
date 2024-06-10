//FootballLeagueApplication
//ProgressView.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation
import SwiftUI

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(8)
            .background(Color(.lightGray).opacity(0.8))
            .font(.body)
            .cornerRadius(8)

    }
}

struct loadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }

}
