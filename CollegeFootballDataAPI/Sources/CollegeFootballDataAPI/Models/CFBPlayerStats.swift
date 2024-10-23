//
//  PlayerStats.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/16/24.
//

public struct CFBPlayerStats: Codable, Sendable, CustomStringConvertible {
    public let playerId: String
    public let player: String
    public let team: String
    public let conference: String
    public let category: String
    public let statType: String
    public let stat: String

    public var description: String {
        return """
\(player)
    playerId: \(playerId)
    player: \(player)
    team: \(team)
    conference: \(conference)
    category: \(category)
    statType: \(statType)
    stat: \(stat)

"""
    }
}
