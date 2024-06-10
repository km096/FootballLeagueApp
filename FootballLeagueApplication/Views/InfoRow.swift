//FootballLeagueApplication
//InfoRow.swift

//Created by: Kareem on 6/10/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.bold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 5)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
  InfoRow(label: "title", value: "value")
}
