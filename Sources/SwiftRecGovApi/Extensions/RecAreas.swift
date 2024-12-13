//
//  RecArea.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/19/24.
//

import Foundation

public extension RecreationGovApiClient  {
    ///Recreation areas are large tracts of federal land for the purpose of, you guessed it, recreating! Recreation areas have many distinguishing characteristics (attributes) ranging from addresses, organizations, links, media links, activities, etc. Recreation areas can contain one to many child facilities. Recreation area examples are Yosemite National Park and the Aldo Leopold Wilderness.
    
    func getAllRecAreas(query: String? = nil, limit: Int = 50, offset: Int = 0, fullDetails: String = "true") async throws -> [RecArea] {
        let url = baseURL.appendingPathComponent("/recareas")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "full", value: fullDetails)
        ]

        return try await fetchAndDecode(url: url, queryItems: queryItems)
    }
    
    func getRecAreaByID(recAreaID: String) async throws -> RecArea? {
        let url = baseURL.appendingPathComponent("/recareas/\(recAreaID)")
        
        
        return try await fetchAndDecode(url: url)
    }
    
    func getRecAreasByID(orgID: String, query: String = "", limit: Int = 50, offset: Int = 0, fullDetails: String = "true", sort: SortingKey = .name ) async throws -> [RecArea] {
        let url = baseURL.appendingPathComponent("/organizations/\(orgID)/recareas")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "full", value: fullDetails),
            URLQueryItem(name: "sort", value: sort.rawValue)
        ]
        
        return try await fetchAndDecode(url: url, queryItems: queryItems)
    }
    
    func getRecAreaByID(recAreaID: String, orgID: String, fullDetails: String = "true") async throws -> RecArea? {
        let url = baseURL.appendingPathComponent("/organizations/\(orgID)/recareas/\(recAreaID)")
        
        let queryItems = [URLQueryItem(name: "full", value: fullDetails)]
        
        return try await fetchAndDecode(url: url, queryItems: queryItems)
    }
    
}

