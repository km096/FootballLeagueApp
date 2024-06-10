//FootballLeagueApplication
//ErrorMessages.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import Foundation

enum APIError: String, Error {
    case invalidURL = "There was an issue connecting to the server. If this persists, please contact support"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again later or contact support"
    case invalidData = "The data received from the server was invalid. Please contact support."
  case genericError = "Something wrong happened with your task. Please check your connection or try again later"
}


enum DataBaseError: Error{
    case faliedToSaveData
    case faliedTofetchData
    case faliedToDeleteData
}
