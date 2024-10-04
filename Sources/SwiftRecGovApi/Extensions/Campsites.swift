//
//  Campsite.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import Foundation

public extension RecreationGovApiClient {
    func getAllCampsites(query: String? = nil, limit: Int = 50, offset: Int = 0) async throws -> [Campsite] {
        let url = baseURL.appendingPathComponent("/campsites")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]

        return try await fetchAndDecode(Campsite.self,  url: url, queryItems: queryItems)
    }
    
    func getCampsitesByID(facilityID: String = "", query: String? = nil, limit: Int = 50, offset: Int = 0) async throws -> [Campsite] {
        let url = baseURL.appendingPathComponent("/facilities/\(facilityID)/campsites")
        
        let queryItems = [

            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        
        return try await fetchAndDecode(Campsite.self,  url: url, queryItems: queryItems)
    }
    
    func getCampsiteByID(campsiteID: String = "") async throws -> Campsite? {
        let url = baseURL.appendingPathComponent("/campsites/\(campsiteID)")
        
        return try await fetchAndDecodeSingle(Campsite.self, url: url)
    }
    
    func getCampsiteByID(facilityID: String, campsiteID: String) async throws -> Campsite? {
        let url = baseURL.appendingPathComponent("/facilities/\(facilityID)/campsites/\(campsiteID)")
        
        return try await fetchAndDecodeSingle(Campsite.self, url: url)
    }
    
}
