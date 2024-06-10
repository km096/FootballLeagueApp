//FootballLeagueApplication
//Competions.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation

struct CompetitionsModel: Codable {
    let count: Int?
    let filters: Filters?
    let competitions: [Competition]?
}

struct Filters: Codable {
    let client: String?
}

struct Competition: Codable, Identifiable {
    var id: Int?
    var area: Area?
    var name: String?
    var code: String?
    var type: String?
    var emblem: String?
    var plan: String?
    var currentSeason: CurrentSeason?
    var numberOfAvailableSeasons: Int?
    var lastUpdated: String?
}

struct Area: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

struct CurrentSeason: Codable {
    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}

struct Winner: Codable, Identifiable {
    let id: Int?
    let name: String?
    let shortName: String?
    let tla: String?
    let crest: String?
    let address: String?
    let website: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
    let lastUpdated: String?
}
