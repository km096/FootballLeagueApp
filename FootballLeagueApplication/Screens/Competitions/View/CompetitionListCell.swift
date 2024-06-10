//FootballLeagueApplication
//CompetionListCell.swift

//Created by: Kareem on 6/10/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct CompetitionListCell: View {

  let competition: Competition
    var body: some View {
          HStack {
            AsyncImage(url: URL(string: competition.emblem ?? "")) { image in
                  image
                      .listCellImageModifier()
              } placeholder: {
                Image(.placeholder)
                      .listCellImageModifier()
              }


              VStack(alignment: .leading, spacing: 5) {
                Text(competition.name ?? "Unknown")
                    .font(.headline)
                Text("Teams: \(competition.numberOfAvailableSeasons ?? 0) | Games: \(competition.currentSeason?.currentMatchday ?? 0)")
                    .font(.subheadline)
                Text("Short Name: \(competition.code ?? "N/A")")
                    .font(.subheadline)
              }
              .padding(.leading)
            Spacer()
          }

    }
}

#Preview {
  CompetitionListCell(competition: Competition())
}

extension Image {
    func listCellImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}
