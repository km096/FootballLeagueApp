//FootballLeagueApplication
//Alerts.swift

//Created by: Kareem on 6/9/24                      
//Copyright (c) 2023 Kareem

import SwiftUI

struct AlertItem: Identifiable {
    let id =  UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                              message: Text(APIError.invalidURL.rawValue),
                                              dismissButton: .default(Text("OK")))

    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                              message: Text(APIError.invalidResponse.rawValue),
                                              dismissButton: .default(Text("OK")))

    static let invalidData = AlertItem(title: Text("Server Error"),
                                              message: Text(APIError.invalidData.rawValue),
                                              dismissButton: .default(Text("OK")))

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text(APIError.unableToComplete.rawValue),
                                              dismissButton: .default(Text("OK")))

  static let genericError = AlertItem(title: Text("Something wrong happened"),
                                            message: Text(APIError.genericError.rawValue),
                                            dismissButton: .default(Text("OK")))

}

