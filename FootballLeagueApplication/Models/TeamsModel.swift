//FootballLeagueApplication
//TeamsModel.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation

struct TeamsModel: Codable {
    let count: Int?
    let filters: TeamFilters?
    let competition: Competition?
    let season: Season?
    let teams: [Team]?
}

struct TeamFilters: Codable {
    let season: String?
}

struct Season: Codable {
    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}

struct Team: Codable, Identifiable {
    var id: Int?
    var area: Area?
    var name: String?
    var shortName: String?
    var tla: String?
    var crest: String?
    var address: String?
    var website: String?
    var founded: Int?
    var clubColors: String?
    var venue: String?
    var runningCompetitions: [RunningCompetition]?
    var coach: Coach?
    var squad: [Player]?
    var staff: [Staff]?
    var lastUpdated: String?
}

struct RunningCompetition: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let type: String?
    let emblem: String?
}

struct Coach: Codable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let name: String?
    let dateOfBirth: String?
    let nationality: String?
    let contract: Contract?
}

struct Contract: Codable {
    let start: String?
    let until: String?
}

struct Player: Codable, Identifiable {
    var id: Int?
    var name: String?
    var position: String?
    var dateOfBirth: String?
    var nationality: String?
}

struct Staff: Codable {
    let id: Int?
    let name: String?
    let role: String?
}
