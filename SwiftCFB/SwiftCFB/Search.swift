//
//  Search.swift
//  ItJustMeansMoreCLI
//
//  Created by Jonathan Long on 10/18/24.
//

import ArgumentParser
import CollegeFootballDataAPI
import CollegeFootballDataInterface
import Foundation

extension SwiftCFB {
    struct Search: AsyncParsableCommand {
        static let configuration = CommandConfiguration(abstract: "Search for a player.")


        @OptionGroup var options: Options
        mutating func run() async throws {
            let client = CollegeFootballDataAPIClient(apiKey: Options.APIKey)
            let player = options.playerName
            let result = try await client.requestData(endPoint: SearchPlayersRequest(name: player))
            result.forEach {
                print($0)
            }
        }
    }
}
