//FootballLeagueApplication
//Competions.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem


import Foundation

// MARK: - CompetitionsModel
struct CompetitionsModel: Codable {
    let count: Int?
    let competitions: [Competition]?
}

// MARK: - Competition
struct Competition: Codable, Identifiable {
    var id: Int?
    var name: String?
    var code: String?
    var emblemUrl: String?
    var currentSeason: CurrentSeason?
    var numberOfAvailableSeasons: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case emblemUrl
        case currentSeason, numberOfAvailableSeasons
    }
}


// MARK: - CurrentSeason
struct CurrentSeason: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
}


// MARK: - CompetitionDetailsModel
struct CompetitionDetailsModel: Codable {
    var id: Int?
    var name, code: String?
    var emblemURL: String?
    var plan: String?
    var currentSeason: Season?
    var seasons: [Season]?

    enum CodingKeys: String, CodingKey {
        case id, name, code
        case emblemURL
        case plan, currentSeason, seasons
    }
}


// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
}
