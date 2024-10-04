//
//  Exten.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 9/28/24.
//
// swift-recreationgov-api/Sources/RecreationGovApiClient/RecreationGovApiClient+Activities.swift

import Foundation

public extension RecreationGovApiClient {
    
    //Retrieve all activities
    func getAllActivities(query: String? = "", limit: Int = 50, offset: Int = 0) async throws -> [Activity] {
        let url = baseURL.appendingPathComponent("/activities")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]

        return try await fetchAndDecode(Activity.self, url: url, queryItems: queryItems)
    }
    
    //Retrieve a specific activity by ID
    func getActivitiesByID(activityID: String) async throws -> Activity? {
        let url = baseURL.appendingPathComponent("/activities/\(activityID)")
        
        return try await fetchAndDecodeSingle(Activity.self, url: url)
    }
    
    //Retrieve all activities for a RecArea
    func getActivitiesByID(recAreaID: String, query: String? = "", limit: Int = 50, offset: Int = 0) async throws -> [Activity] {
        let url = baseURL.appendingPathComponent("/recareas/\(recAreaID)/activities")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        
        return try await fetchAndDecode(Activity.self, url: url, queryItems: queryItems)
    }
    
    //Retrieve a specific activity by ID for a RecArea
    func getActivitiesByID(recAreaID: String, activityID: String) async throws -> Activity? {
        let url = baseURL.appendingPathComponent("/recareas/\(recAreaID)/activities/\(activityID)")
        
        return try await fetchAndDecodeSingle(Activity.self, url: url)
    }
    
    //Retrieve all activies for a facility
    func getActivitiesByID(facilityID: String, query: String = "", limit: Int = 50, offset: Int = 0) async throws -> [Activity] {
        let url = baseURL.appendingPathComponent("/facilities/\(facilityID)/activities")
        
        let queryItem = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        
        return try await fetchAndDecode(Activity.self, url: url, queryItems: queryItem)
    }
    
    //Retrieve a specific activity by ID for a facility
    func getActivitiesByID(facilityID: String, activitiyID: String) async throws -> Activity? {
        let url = baseURL.appendingPathComponent("/facilities/\(facilityID)/activities/\(activitiyID)")
        
        return try await fetchAndDecodeSingle(Activity.self, url: url)
    }
}
