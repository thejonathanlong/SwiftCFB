//
//  Options.swift
//  ItJustMeansMoreCLI
//
//  Created by Jonathan Long on 10/18/24.
//

import ArgumentParser

struct Options: ParsableArguments {
//    @Flag(name: [.long, .customShort("x")], help: "Use hexadecimal notation for the result.")
//    var hexadecimalOutput = false

    static let APIKey = "j+KYlVRcWT7mF6GMKcOjJqhhmaTK3m9tT6DCSvx3Mg5t/WD4RKcvmEYB7m+yaiiE"

    @Argument(help: "A player name you are interested in.")
    var playerName: String

    @Argument(help: "The year.")
    var year: Int?
}
