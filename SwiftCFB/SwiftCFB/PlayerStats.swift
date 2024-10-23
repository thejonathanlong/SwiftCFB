//
//  PlayerStats.swift
//  ItJustMeansMoreCLI
//
//  Created by Jonathan Long on 10/18/24.
//

import ArgumentParser
import CollegeFootballDataAPI
import CollegeFootballDataInterface
import Foundation

extension SwiftCFB {
    struct Stats: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Get stats for a specific player.")


        @OptionGroup var options: Options
        mutating func run() async throws {
            let client = CollegeFootballDataAPIClient(apiKey: Options.APIKey)
            let player = options.playerName
            let year = options.year ?? 2024
            let result = try await client.requestData(endPoint: SearchPlayersRequest(name: player))
            let stats = try await client.requestData(endPoint: PlayerStatsRequest(playerId: Int(result.first?.id ?? "0") ?? -1, season: year, team: result.first?.team ?? ""))
            let results = stats.filter { $0.playerId == result.first?.id }
            results.forEach {
                print($0)
            }
        }
    }
}
