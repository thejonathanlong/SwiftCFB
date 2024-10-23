//
//  Football.swift
//  ItJustMeansMoreCLI
//
//  Created by Jonathan Long on 10/18/24.
//

import ArgumentParser

@main
struct SwiftCFB: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility for querying College Football Stats.",
        subcommands: [Search.self, Stats.self],
        defaultSubcommand: Search.self)
}
