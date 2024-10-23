//
//  SearchPlayersRequest.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/17/24.
//

import CollegeFootballDataInterface
import Foundation

public struct SearchPlayersRequest: CFBRequestInterface, Sendable {

    public typealias Model = CFBPlayer

    public let endpoint: CFBEndPoint

    public init(name: String) {
        endpoint = .searchPlayers(name: name)
    }
}
