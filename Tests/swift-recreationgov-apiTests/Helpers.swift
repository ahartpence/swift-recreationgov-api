//
//  Helpers.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//
import Foundation
import SwiftRecGovApi

enum testingIDs: String {
    case orgId = "128" // National Parks Service
    case activityId = "6" // TODO: Lookup
    case facilityID = "232458" // Platte River Campground
    case recAreaId = "1113" // Wallowa Whitman National Forest
}

// Helper function to create the API client
func createApiClient() -> RecreationGovApiClient {
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"] ?? ""
    return RecreationGovApiClient(apiKey: apiKey)
}

// Helper function to print error messages
func printError(_ errorMessage: String?) {
    print(errorMessage ?? "None")
}
