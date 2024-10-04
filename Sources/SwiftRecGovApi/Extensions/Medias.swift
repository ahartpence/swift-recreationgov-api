//
//  Media.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/22/24.
//

import Foundation


public extension RecreationGovApiClient {
    
    
    func getAllMedia(query: String? = nil, limit: Int = 50, offset: Int = 0) async throws  -> [Media] {
        let url =  baseURL.appendingPathComponent("/media")
        
        let queryItems = [URLQueryItem(name: "limit", value: "\(limit)"), URLQueryItem(name: "offset", value: "\(offset)")]
        
        return try await fetchAndDecode(Media.self, url: url, queryItems: queryItems)
    }
}
