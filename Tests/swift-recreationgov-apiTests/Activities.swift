//
//  Activities.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//

import Foundation
import Testing
import SwiftRecGovApi



@Test("Get all activities, store values in [Activity]")
func canGetAllActivities() async throws {
    var activities: [Activity] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedActivities = try await apiClient.getAllActivities(limit: 50, offset: 0)
        activities = fetchedActivities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!activities.isEmpty)
}
