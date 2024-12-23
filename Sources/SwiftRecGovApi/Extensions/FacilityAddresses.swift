//
//  FacilityAddresses.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/29/24.
//


import Foundation

public extension RecreationGovApiClient {
    ///Retrieve a specific facility by Id
    func getFacilityAddressByID(facilityID: String, fullDetails: String = "true") async throws -> Facility? {
        let url =  baseURL.appendingPathComponent("/facilities/\(facilityID)")
        
        let queryItems = [URLQueryItem(name: "fullDetails", value: fullDetails)]
        
        return try await fetchAndDecode(url: url, queryItems: queryItems)
    }
    
 
}

