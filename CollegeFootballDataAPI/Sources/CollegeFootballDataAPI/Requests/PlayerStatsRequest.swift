//
//  PlayerStatsRequest.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/17/24.
//

import CollegeFootballDataInterface
import Foundation

public struct PlayerStatsRequest: CFBRequestInterface {
    public typealias Model = CFBPlayerStats

    public let endpoint: CFBEndPoint

    public init(playerId: Int, season: Int, team: String) {
        endpoint = .playerStats(playerId: playerId, season: season, team: team)
    }
}
