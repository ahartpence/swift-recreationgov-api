//
//  Campsites.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//
import Foundation
import Testing
import SwiftRecGovApi


@Test("Get all campsites, store values in [Campsite]")
func canGetAllCampsites() async throws {
    var campsites: [Campsite] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedActivities = try await apiClient.getAllCampsites(limit: 50, offset: 0)
        campsites = fetchedActivities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!campsites.isEmpty)
}


@Test("Get list of campsites for Platte River Campground (Facility) by Facility ID, store values in [Campsite]")
func getCampsitesByFacility() async throws {
    var campsites: [Campsite] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedCampsites = try await apiClient.getCampsitesByID(facilityID: testingIDs.facilityID.rawValue)
        campsites = fetchedCampsites
        
    } catch {
        errorMessage = "Failed to load campsites: \(error)"
    }
    
    print(errorMessage ?? "")
    #expect(!campsites.isEmpty)
}

@Test("Unified Search: Query 'Platte River' across all endpoints")
func canPerformUnifiedSearch() async throws {
    var facilities: [Facility] = []
    var campsites: [Campsite] = []
    var recAreas: [RecArea] = []
    var errorMessage: String?
    
    let apiClient = createApiClient()
    
    do {
        async let fetchedFacilities = apiClient.getAllFacilities(query: "Platte River", limit: 50, offset: 0)
        async let fetchedCampsites = apiClient.getAllCampsites(query: "Platte River", limit: 50, offset: 0)
        async let fetchedRecAreas = apiClient.getAllRecAreas(query: "Platte River", limit: 50, offset: 0)
        
        facilities = try await fetchedFacilities
        campsites = try await fetchedCampsites
        recAreas = try await fetchedRecAreas
    } catch {
        errorMessage = "Failed to load search results: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!facilities.isEmpty || !campsites.isEmpty || !recAreas.isEmpty)
}

