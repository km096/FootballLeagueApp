//FootballLeagueApplication
//NetworkManager.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation
import UIKit


final class NetworkManager {

  static let shared = NetworkManager()
  private let cache = NSCache<NSString, UIImage>()



  private init() {}
  func fetchData<T: Decodable>(from urlString: String) async throws -> T {
    guard let url = URL(string: urlString) else {
      throw APIError.invalidURL
    }

    var request = URLRequest(url: url)
    request.addValue(URLCreator.shared.apiKey, forHTTPHeaderField: "X-Auth-Token")

    let (data, _) = try await URLSession.shared.data(for: request)

    do {
      let decoder = JSONDecoder()
      let decodedResponse = try decoder.decode(T.self, from: data)
      return decodedResponse
    } catch {
      print(error.localizedDescription)
      throw APIError.genericError
    }
  }

  func fetchCompetitions() async throws -> CompetitionsModel {
    let urlString = URLCreator.shared.createUrlWith(.competitions)
    return try await fetchData(from: urlString)
  }

  func fetchCompetitionDetails(for competitionId: Int) async throws -> CompetitionDetailsModel {
    let urlString = URLCreator.shared.createUrlWith(.competitionDetails(id: competitionId))
    return try await fetchData(from: urlString)
  }

  func fetchTeams(for competitionId: Int) async throws -> TeamsModel {
    let urlString = URLCreator.shared.createUrlWith(.teams(id: competitionId))
    return try await fetchData(from: urlString)
  }

  func errorHandling(_ error: Error) -> AlertItem? {
    if let apiError = error as? APIError {
      switch apiError {
      case .invalidURL:
        return AlertContext.invalidURL
      case .invalidResponse:
        return AlertContext.invalidResponse
      case .invalidData:
        return AlertContext.invalidData
      case .unableToComplete:
        return AlertContext.unableToComplete
      case .genericError:
        return AlertContext.genericError
      }
    } else {
      return AlertContext.genericError
    }

  }
}



