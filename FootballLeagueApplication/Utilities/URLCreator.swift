//FootballLeagueApplication
//URLCreator.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation

//MARK: - URLs
class URLCreator {
    static let shared = URLCreator()

  let baseURL = "https://api.football-data.org/v2/"
  let apiKey = "a30f03b385cc4e57968ac20f9257b352"

    private init() {}

    func createUrlWith(_ endpoint: Endpoints) -> String{
      return endpoint.baseURL + endpoint.path
    }



}

//MARK: - Endpoints
enum Endpoints {
  case competitions
  case competitionDetails(id: Int)
  case teams(id: Int)

}


extension Endpoints {
  var baseURL: String {
    let source = URLCreator.shared.baseURL
      return source
  }

  var path: String {
    switch self {
    case .competitions:
      return "competitions"
    case .competitionDetails(let id):
      return "competitions/\(id)"
    case .teams(let id):
      return "competitions/\(id)/teams"
    }
  }
}
