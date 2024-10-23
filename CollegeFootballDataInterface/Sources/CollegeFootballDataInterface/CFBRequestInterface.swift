//
//  CFBEndPoint.swift
//  CollegeFootballDataInterface
//
//  Created by Jonathan Long on 10/17/24.
//
import Foundation

public protocol CFBRequestInterface {
    associatedtype Model: Codable

    var endpoint: CFBEndPoint { get }

    func request(key: String) -> URLRequest
}

public extension CFBRequestInterface {
    var queryItems: [URLQueryItem] {
        switch endpoint {
        case .searchPlayers(let byName):
            return [URLQueryItem(name: "searchTerm", value: byName)]
        case .playerStats(let playerId, let season, let team):
            return [
                URLQueryItem(name: "playerId", value: String(playerId)),
                URLQueryItem(name: "year", value: String(season)),
                URLQueryItem(name: "team", value: String(team))
            ]
        }
    }

    var components: URLComponents {
        let baseUrl = "https://api.collegefootballdata.com"
        let component: String
        switch endpoint {
        case .searchPlayers:
            component = "/player/search"

        case .playerStats:
            component = "/stats/player/season"
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.collegefootballdata.com"
        components.path = component
        components.queryItems = queryItems
        return components
    }

    func request(key: String) -> URLRequest {
        var request = URLRequest(url: components.url!)
        request.addValue("Bearer \(key)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        return request
    }
}
