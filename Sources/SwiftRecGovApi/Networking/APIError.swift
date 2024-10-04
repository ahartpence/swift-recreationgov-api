//
//  APIError.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 9/29/24.
//


// swift-recreationgov-api/Sources/RecreationGovApiClient/Networking/APIError.swift

import Foundation

public enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
    case serverError(statusCode: Int, data: Data?)
}
