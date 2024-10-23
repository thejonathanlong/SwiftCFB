//
//  CFBNetworkManager.swift
//  CollegeFootballDataInterface
//
//  Created by Jonathan Long on 10/17/24.
//
import Foundation

public protocol CFBNetworkManagerInterface {
    func data(for: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: CFBNetworkManagerInterface { }
