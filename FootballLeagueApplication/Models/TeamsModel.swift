//FootballLeagueApplication
//TeamsModel.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation
// MARK: - TeamsModel
struct TeamsModel: Codable {
    let count: Int?
    let competition: Competition?
    let teams: [Team]?
}


// MARK: - Team
struct Team: Codable, Identifiable {
    var id: Int?
    var name, shortName, tla: String?
    var crestUrl: String?
    var address: String?
    var phone: String?
    var website: String?
    var email: String?
    var founded: Int?
    var clubColors, venue: String?

    enum CodingKeys: String, CodingKey {
        case id, name, shortName, tla
        case crestUrl
        case address, phone, website, email, founded, clubColors, venue
    }
}
