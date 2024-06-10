//FootballLeagueApplication
//CompetitionsViewModel.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

@MainActor
final class CompetitionsViewModel: ObservableObject {
  @Published var competitions: [Competition] = []
  @Published var alertItem: AlertItem?
  @Published var isLoading = false
  @Published var errorMessage: String?

  
  func fetchCompetitions() {
    isLoading = true

    Task {
      do {
        let competitionsModel = try await NetworkManager.shared.fetchCompetitions()
        competitions = competitionsModel.competitions ?? []
        isLoading = false
      } catch {
        alertItem = NetworkManager.shared.errorHandling(error)
      }

    }
  }


}
