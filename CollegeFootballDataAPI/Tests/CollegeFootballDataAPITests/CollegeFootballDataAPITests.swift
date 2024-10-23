import XCTest
@testable import CollegeFootballDataAPI

final class CollegeFootballDataAPITests: XCTestCase {

    // Test search players functionality using mock data
    func testSearchPlayers() async throws {
        // Setup the mock network manager with the expected URL and mock JSON file
        let mockNetworkManager = MockNetworkManager(
            mockResponses: [
                "https://api.collegefootballdata.com/player/search?searchTerm=John Doe": "SearchPlayersSimple"
            ]
        )

        // Create the API client with the mock network manager
        let client = CollegeFootballDataAPIClient(apiKey: "test-api-key", networkManager: mockNetworkManager)

        // Create the search players endpoint
        let endPoint = SearchPlayersEndPoint(name: "John Doe")

        // Perform the request
        let players = try await client.requestData(endPoint: endPoint)

        XCTAssertEqual(players.count, 2)
        XCTAssertEqual(players[0].firstName, "John")
        XCTAssertEqual(players[0].lastName, "Doe")
        XCTAssertEqual(players[0].team, "Team A")
        XCTAssertEqual(players[0].position, "QB")
        XCTAssertEqual(players[0].year, 3)
        XCTAssertEqual(players[0].height, 190)
        XCTAssertEqual(players[0].hometown, "Some City")
        XCTAssertEqual(players[0].state, "TX")
    }

    // Test player stats functionality using mock data
    func testGetPlayerStats() async throws {
        // Setup the mock network manager with the expected URL and mock JSON file
        let mockNetworkManager = MockNetworkManager(
            mockResponses: [
                "https://api.collegefootballdata.com/player/stats?playerId=1&season=2023": "PlayersStatsSimple"
            ]
        )

        // Create the API client with the mock network manager
        let client = CollegeFootballDataAPIClient(apiKey: "test-api-key", networkManager: mockNetworkManager)

        // Create the player stats endpoint
        let endPoint = PlayerStatsEndPoint(playerId: 1, season: 2023)

        // Perform the request
        let stats = try await client.requestData(endPoint: endPoint)

        // Assert that the data is parsed correctly
        XCTAssertEqual(stats.count, 2)
        XCTAssertEqual(stats[0].playerId, 123)
        XCTAssertEqual(stats[0].season, 2023)
        XCTAssertEqual(stats[0].gamesPlayed, 12)
        XCTAssertEqual(stats[0].passingYards, 3500)
        XCTAssertEqual(stats[0].touchdowns, 30)
        XCTAssertEqual(stats[1].rushingYards, 1100)
        XCTAssertEqual(stats[1].fumbles, 1)
    }
}
