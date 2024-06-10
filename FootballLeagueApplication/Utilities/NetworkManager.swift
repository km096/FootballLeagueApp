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
  private let apiKey = "a30f03b385cc4e57968ac20f9257b352"
  func fetchData<T: Decodable>(from urlString: String) async throws -> T {
    guard let url = URL(string: urlString) else {
      throw APIError.invalidURL
    }

    var request = URLRequest(url: url)
    request.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else { return [] as! T }

    print("url ---> \(request.url)")
    print("method ---> \(request.httpMethod)")
    print("statusCode ---> \(httpResponse.statusCode)")
    print("headers ---> \(request.allHTTPHeaderFields)")
    do {
      let decoder = JSONDecoder()
      let decodedResponse = try decoder.decode(T.self, from: data)
      return decodedResponse
    } catch {
      throw APIError.genericError
    }
  }

  func fetchCompetitions() async throws -> CompetitionsModel {
    let urlString = URLCreator.shared.createUrlWith(.competitions)
    return try await fetchData(from: urlString)
  }

  func fetchCompetitionDetails(for competitionId: Int) async throws -> Competition {
    let urlString = URLCreator.shared.createUrlWith(.competitionDetails(id: competitionId))
    return try await fetchData(from: urlString)
  }

  func fetchTeams(for competitionId: Int) async throws -> TeamsModel {
    let urlString = URLCreator.shared.createUrlWith(.teams(id: competitionId))
    return try await fetchData(from: urlString)
  }

  func downloadImage(fromURlStrnig urlString: String, completion: @escaping (UIImage?) -> Void) {

    let cacheKey = NSString(string: urlString)

    if let image = cache.object(forKey: cacheKey) {
      completion(image)
      return
    }

    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }
    
    _ = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      guard let data, let image = UIImage(data: data) else {
        completion(nil)
        return
      }

      self.cache.setObject(image, forKey: cacheKey)
      completion(image)
    }
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



