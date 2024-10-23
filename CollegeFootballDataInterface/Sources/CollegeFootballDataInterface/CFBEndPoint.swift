//
//  CFBEndPoint.swift
//  CollegeFootballDataInterface
//
//  Created by Jonathan Long on 10/17/24.
//

public enum CFBEndPoint: Sendable {
    case searchPlayers(name: String)
    case playerStats(playerId: Int, season: Int, team: String)
    case boxScores(season: Int, team: String, week: Int?)
}


