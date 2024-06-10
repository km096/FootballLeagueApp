//FootballLeagueApplication
//TeamDetailView.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem


import SwiftUI

struct TeamDetailView: View {
    var team: Team
  @Environment(\.dismiss) var dismiss
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        if let logoURL = team.crest, let url = URL(string: logoURL) {
          AsyncImage(url: url) { image in
            image
              .resizable()
              .scaledToFit()
              .frame(height: 300)
          } placeholder: {
            Image(.placeholder)
              .resizable()
              .scaledToFit()
              .frame(height: 300)
          }
        }
        VStack(alignment: .leading, spacing: 20) {
          Text("Team Info")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 10)

          Group {
            InfoRow(label: "Name", value: team.name ?? "Unknown")
            InfoRow(label: "Short Name", value: team.shortName ?? "Unknown")
            InfoRow(label: "Address", value: team.address ?? "Unknown")
            InfoRow(label: "Website", value: team.website ?? "Unknown")
            InfoRow(label: "Founded", value: team.founded?.description ?? "Unknown")
            InfoRow(label: "Club Colors", value: team.clubColors ?? "Unknown")
            InfoRow(label: "Venue", value: team.venue ?? "Unknown")
          }

          if let coach = team.coach {
            Text("Coach")
              .font(.title2)
              .fontWeight(.bold)
              .padding(.top)
            InfoRow(label: "Name", value: coach.name ?? "Unknown")
            InfoRow(label: "Nationality", value: coach.nationality ?? "Unknown")
            InfoRow(label: "Contract", value: "\(coach.contract?.start ?? "Unknown") - \(coach.contract?.until ?? "Unknown")")
          }
          
          Text("Players")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top)

          ForEach(team.squad ?? []) { player in
            PlayerRow(player: player)
          }
        }
      }
      .padding()

    }
    .navigationTitle(team.name ?? "Team Details")
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.backward")
            .foregroundStyle(.black)
        }
      }
    }
  }
}

#Preview {
  TeamDetailView(team: Team())
}

