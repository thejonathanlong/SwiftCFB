//
//  CFBTeam.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/23/24.
//

import Foundation

struct CFBTeam: Codable, Sendable {
    let id: Int
    let school: String
    let mascot: String
    let abbreviation: String
    let altName1: String?
    let altName2: String?
    let altName3: String?
    let classification: String
    let conference: String
    let division: String?
    let color: String?
    let altColor: String?
    let logos: [String]?
    let twitter: String?
    let location: Location

    struct Location: Codable {
        let venueID: Int
        let name: String
        let city: String
        let state: String
        let zip: String?
        let countryCode: String
        let timezone: String
        let latitude: Double
        let longitude: Double
        let elevation: Double
        let capacity: Int?
        let yearConstructed: Int?
        let grass: Bool
        let dome: Bool
    }

    enum CodingKeys: String, CodingKey {
        case id
        case school
        case mascot
        case abbreviation
        case altName1 = "alt_name_1"
        case altName2 = "alt_name_2"
        case altName3 = "alt_name_3"
        case classification
        case conference
        case division
        case color
        case altColor = "alt_color"
        case logos
        case twitter
        case location
    }
}
