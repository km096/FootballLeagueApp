//FootballLeagueApplication
//Model.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

@MainActor
final class CompetitionDetailViewModel: ObservableObject {
  @Published var teams: [Team] = []
  @Published var competitionDetails: CompetitionDetailsModel = CompetitionDetailsModel()
  @Published var alertItem: AlertItem?
  @Published var isLoading = false
  @Published var errorMessage: String?
  


  func fetchCompetitionDetails(for competitionId: Int) {
    isLoading = true
    Task {
      do {
        let competitionModel = try await NetworkManager.shared.fetchCompetitionDetails(for: competitionId)
        self.competitionDetails = competitionModel
        isLoading = false
      } catch {
        alertItem = NetworkManager.shared.errorHandling(error)
      }
    }
  }

  func fetchTeams(for competitionId: Int) {
    isLoading = true
    Task {
      do {
        let teamsModel = try await NetworkManager.shared.fetchTeams(for: competitionId)
        self.teams = teamsModel.teams ?? []
        isLoading = false
      } catch {
        alertItem = NetworkManager.shared.errorHandling(error)
      }
    }



  }
}
