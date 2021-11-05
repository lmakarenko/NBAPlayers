//
//  Game.swift
//  NBAPlayers
//
//  Created by Lev Makarenko on 27.01.2021.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    
    let date: String
    let homeTeamScore: Int?
    let visitorTeamScore: Int?
    let season: Int?
    let period: Int
    let status: String
    
    let homeTeam: Team
    let visitorTeam: Team

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
        case season = "season"
        case period = "period"
        case status = "status"
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
    }
    
    var fullName: String {
        return  gameSeason + " : " + homeTeam.abbreviation + " - " + visitorTeam.abbreviation
    }
    
    var gameSeason: String {
        if let season = season {
            return "\(season)"
        } else {
            return "unknown"
        }
    }
    
    var score: String {
        if let homeTeamScore = homeTeamScore, let visitorTeamScore = visitorTeamScore {
            return  "\(homeTeamScore) - \(visitorTeamScore)"
        } else {
            return "Unknown"
        }
    }
    
    var homeTeamScoreStr: String {
        if let homeTeamScore = homeTeamScore {
            return  "\(homeTeamScore)"
        } else {
            return "Unknown"
        }
    }
    
    var visitorTeamScoreStr: String {
        if let visitorTeamScore = visitorTeamScore {
            return  "\(visitorTeamScore)"
        } else {
            return "Unknown"
        }
    }
}
