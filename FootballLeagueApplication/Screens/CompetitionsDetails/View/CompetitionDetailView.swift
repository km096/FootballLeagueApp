//FootballLeagueApplication
//CompetitionDetailView.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct CompetitionDetailView: View {
  var competition: Competition
  @StateObject private var viewModel = CompetitionDetailViewModel()
  @Environment(\.dismiss) var dismiss
  var body: some View {
    VStack {
      VStack {
        AsyncImage(url: URL(string: competition.emblem ?? "")) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 150)
            .cornerRadius(8)
        } placeholder: {
          Image(.placeholder)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 150)
            .cornerRadius(8)
        }


        ScrollView {
          VStack(alignment: .leading, spacing: 20) {
            Text("Competition Info")
              .font(.largeTitle)
              .fontWeight(.bold)

            Group {
              InfoRow(label: "Name", value: competition.name ?? "Unknown")
              InfoRow(label: "Short Name", value: competition.code ?? "Unknown")
              InfoRow(label: "Number of Team", value: "\(competition.numberOfAvailableSeasons ?? 0)")
              InfoRow(label: "Number of Games", value: "\(competition.currentSeason?.currentMatchday ?? 0)")

            }

            Text("Teams")
              .font(.largeTitle)
              .fontWeight(.bold)

            ForEach(viewModel.teams) { team in
              NavigationLink(destination: TeamDetailView(team: team)) {
                RoundedRectangle(cornerRadius: 15)
                  .fill(.white.gradient)
                  .frame(height: 100)
                  .shadow(color: .gray.opacity(0.5), radius: 5)
                  .padding(.horizontal, 2)
                  .overlay(alignment: .leading) {
                    HStack(spacing: 20) {
                      if let logoURL = team.crest,
                         let url = URL(string: logoURL) {
                        AsyncImage(url: url) { image in
                          image.resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                          Image(.placeholder)
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                      }
                      VStack(alignment: .leading) {
                        Text(team.name ?? "Unknown")
                          .font(.headline)
                        Text(team.shortName ?? "Unknown")
                          .font(.subheadline)
                      }
                      .foregroundStyle(.black)
                      Spacer()
                    }
                    .padding(.horizontal, 20)
                  }

              }
            }
          }
        }
        .scrollIndicators(.never)

      }
      .padding()
      .navigationTitle(competition.name ?? "Competition Details")
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
      .task {
        if let competitionId = competition.id {
          viewModel.fetchTeams(for: competitionId)
        }
      }

      if viewModel.isLoading {
        loadingView()
      }
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title,
            message: alertItem.message,
            dismissButton: alertItem.dismissButton)

    }

  }
}



#Preview {
  CompetitionDetailView(competition: Competition())
}
