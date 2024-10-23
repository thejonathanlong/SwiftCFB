//
//  BoxScoreRequest.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/23/24.
//

import CollegeFootballDataInterface
import Foundation

public struct BoxScoreRequest: CFBRequestInterface {
    public typealias Model = CFBPlayerStats

    public let endpoint: CFBEndPoint

    public init(playerId: Int, season: Int, team: String) {
        endpoint = .playerStats(playerId: playerId, season: season, team: team)
    }
}
