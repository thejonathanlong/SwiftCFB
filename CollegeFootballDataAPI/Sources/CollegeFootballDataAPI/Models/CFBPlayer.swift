//
//  Player.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/16/24.
//

import Foundation

// Player search model
public struct CFBPlayer: Codable, Sendable, CustomStringConvertible {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let team: String
    public let position: String
    public let year: Int?
    public let height: Int?
    public let weight: Int?
    public let hometown: String?
    public let state: String?
    public let country: String?
    public let highSchool: String?
    public let teamColor: String? //hex
    public let teamColorSecondary: String? //hex

    public var description: String {
        return """
\(firstName) \(lastName)
    id: \(id)
    team: \(team)
    position: \(position)
    year: \(year)
    height: \(height)
    weight: \(weight)
    hometown: \(hometown)
    state: \(state)
    country: \(country)
    highSchool: \(highSchool)
    teamColor: \(teamColor)
    teamColorSecondary: \(teamColorSecondary)
"""
    }
}
