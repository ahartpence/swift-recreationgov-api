//
//  Facilities.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import Foundation


///Facilities are points of interest within recreations areas. Facilities can also “stand on their own” without a parent RecArea. Facilities can also be comprised of or more child facilities. Examples are a ranger station, hotel, campground or trail. Facilities can also be areas within larger facilities. Example is Alamo National Park that resides within the Alamo Lake RecArea. Facilities can also be reservable or non-reservable.
///
///Campgrounds (Platte River Campground) are Facilities within RecAreas (Sleeping Bear Dunes Recreation Area)
public extension RecreationGovApiClient {

    ///Retrieve all facilities
    func getAllFacilities(query: String? = nil, limit: Int = 50, offset: Int = 0, fullDetails: String = "true") async throws -> [Facility] {
        let url = baseURL.appendingPathComponent("/facilities")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "full", value: fullDetails)
        ]


        return try await fetchAndDecode(Facility.self,  url: url, queryItems: queryItems)
    }
    
    
    ///Retrieve all facilities for a RecArea
    func getFacilitiesByID(recAreaID: String, query: String? = nil, limit: Int = 50, offset: Int = 0) async throws -> [Facility] {
        let url = baseURL.appendingPathComponent("/recareas/\(recAreaID)/facilities")
        
        let queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]

        return try await fetchAndDecode(Facility.self,  url: url, queryItems: queryItems)
    }
    
    ///Retrieve all facilities for an organization
    func getFacilitiesByID(orgID: String, query: String = "", limit: Int = 50, offset: Int = 0, fullDetails: String = "true", states: [String] = [], activity: [String] = [], sort: SortingKey = .name) async throws -> [Facility] {
        let url = baseURL.appendingPathComponent("/organizations/\(orgID)/facilities")
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "fullDetails", value: fullDetails),
            URLQueryItem(name: "states", value: states.joined(separator: ",")),
            URLQueryItem(name: "activity", value: activity.joined(separator: ",")),
            URLQueryItem(name: "sort", value: sort.rawValue)
        ]
        
        return try await fetchAndDecode(Facility.self, url: url, queryItems: queryItems)
        
    }
    
    
    ///Retrieve a specific facility by Id
    func getFacilityByID(facilityID: String, fullDetails: String = "true") async throws -> Facility? {
        let url =  baseURL.appendingPathComponent("/facilities/\(facilityID)")
        
        let queryItems = [URLQueryItem(name: "fullDetails", value: fullDetails)]
        
        return try await fetchAndDecodeSingle(Facility.self, url: url, queryItems: queryItems)
    }
    
    
    ///Retrieve a specific facility by Id for an organization
    func getFacilityByID(facilityID: String, orgID: String, fullDetails: String = "true") async throws -> Facility? {
        let url = baseURL.appendingPathComponent("/organizations/\(orgID)/facilities/\(facilityID)")
        
        let queryItems = [URLQueryItem(name: "fullDetails", value: fullDetails)]
        
        return try await fetchAndDecodeSingle(Facility.self, url: url, queryItems: queryItems)
    }
    
    
    ///Retrieve a specific facility by Id for a RecArea
    func getFacilityByID(facilityID: String, recAreaId: String, fullDetails: String = "true") async throws -> Facility? {
        let url = baseURL.appendingPathComponent("/recareas/\(recAreaId)/facilities/\(facilityID)")
        
        let queryItems = [URLQueryItem(name: "fullDetails", value: fullDetails)]
        
        return try await fetchAndDecodeSingle(Facility.self, url: url, queryItems: queryItems)
    }
}
