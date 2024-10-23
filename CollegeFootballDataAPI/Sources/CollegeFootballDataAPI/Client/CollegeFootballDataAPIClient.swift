//
//  CollegeFootballDataAPIClient.swift
//  CollegeFootballDataAPI
//
//  Created by Jonathan Long on 10/16/24.
//

import CollegeFootballDataInterface
import Foundation

public class CollegeFootballDataAPIClient {

    private let apiKey: String

    private let networkManager: CFBNetworkManagerInterface

    public init(apiKey: String,
                networkManager: CFBNetworkManagerInterface? = nil) {
        self.apiKey = apiKey
        let config = URLSessionConfiguration()
        config.urlCache = URLCache.shared
        config.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: config)
        self.networkManager = networkManager ?? session
    }

    public func requestData<E: CFBRequestInterface>(endPoint: E) async throws -> [E.Model] {
        let request = endPoint.request(key: apiKey)

        let data = try await networkManager.data(for: request)
        let objects = try JSONDecoder().decode([E.Model].self, from: data.0)

        return objects
    }
}
