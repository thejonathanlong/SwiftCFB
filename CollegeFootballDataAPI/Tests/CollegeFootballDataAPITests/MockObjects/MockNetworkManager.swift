//
//  MockNetworkManager.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/17/24.
//

import Foundation
@testable import CollegeFootballDataAPI

// Mock NetworkManager to simulate API responses using local JSON files.
public class MockNetworkManager: NetworkManager {

    // Dictionary to store mock JSON responses based on the request URL.
    private var mockResponses: [String: String]

    // Initialize with a dictionary of URL to file name mappings.
    public init(mockResponses: [String: String]) {
        self.mockResponses = mockResponses
    }

    // Simulates the data task by returning the content of a local JSON file.
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard let url = request.url?.absoluteString.removingPercentEncoding,
              let fileName = mockResponses[url],
              let fileURL = Bundle.module.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Mock data not found for URL"])
        }

        let data = try Data(contentsOf: fileURL)

        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!

        return (data, response)
    }
}
