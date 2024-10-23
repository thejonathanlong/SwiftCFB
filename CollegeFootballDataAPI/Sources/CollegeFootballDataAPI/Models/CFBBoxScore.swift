//
//  Untitled.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/23/24.
//

public struct CFBPlayer: Codable, Sendable, CustomStringConvertible {
    let homeTeam: CFBTeam
    let awayTeam: CFBTeam
}
