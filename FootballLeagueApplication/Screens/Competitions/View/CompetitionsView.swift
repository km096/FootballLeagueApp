//FootballLeagueApplication
//CompetitionsView.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct CompetitionsView: View {
  @StateObject private var viewModel = CompetitionsViewModel()

  var body: some View {
    NavigationView {
      List(viewModel.competitions) { competition in
        NavigationLink(destination: CompetitionDetailView(competition: competition)) {
          CompetitionListCell(competition: competition)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Competitions")
      .task {
        viewModel.fetchCompetitions()
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
    CompetitionsView()
}
