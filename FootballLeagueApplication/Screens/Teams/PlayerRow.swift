//FootballLeagueApplication
//PlayerCell.swift

//Created by: Kareem on 6/10/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct PlayerRow: View {
    let player: Player

    var body: some View {
      RoundedRectangle(cornerRadius: 10)
        .fill(.white.gradient)
        .frame(height: 100)
        .shadow(color: .gray.opacity(0.5), radius: 5)
        .padding(.horizontal, 2)
        .overlay {
          HStack {
            LazyVStack(alignment: .leading) {
              Text(player.name ?? "Unknown")
                .font(.headline)
                .padding(.bottom, 2)
              Text("Position: \(player.position ?? "Unknown")")
              Text("Nationality: \(player.nationality ?? "Unknown")")
            }
            Spacer()
          }
          .padding()

        }

    }
}




#Preview {
  PlayerRow(player: Player())
}
