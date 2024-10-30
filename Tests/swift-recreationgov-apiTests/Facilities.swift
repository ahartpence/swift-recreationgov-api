//
//  Facilities.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//

import Foundation
import Testing
import SwiftRecGovApi


@Test("Retrieve all facilities")
func canGetAllFacilities() async throws {
    var facilities: [Facility] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedFacilities = try await apiClient.getAllFacilities(limit: 50, offset: 0)
        facilities = fetchedFacilities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    //print(facilities)
    printError(errorMessage)
    #expect(!facilities.isEmpty)
}

@Test("FacilityAddress is able to decode into Facility")
func canDecodeFacilityAddressToFacility() async throws {
    var facilities: [Facility] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedFacilities = try await apiClient.getAllFacilities(limit: 50, offset: 0)
        facilities = fetchedFacilities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    print(facilities)
    printError(errorMessage)
    #expect(!facilities.isEmpty && facilities.first?.address != nil)
}


@Test("Retrieve all facilities for a RecArea")
func canGetFacilitiesByRecAreaId() async throws {
    var facilities: [Facility] = []
    let apiClient = createApiClient()
    var errorMessage: String?
    
    do {
        let fetchedFacilities = try await apiClient.getFacilitiesByID(recAreaID: testingIDs.recAreaId.rawValue, limit: 50, offset: 0)
        facilities = fetchedFacilities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!facilities.isEmpty)
}

@Test("Retrieve all facilities for an organization")
func canGetFacilitiesByOrganizationId() async throws {
    var facilities: [Facility] = []
    let apiClient = createApiClient()
    var errorMessage: String?
    
    do {
        let fetchedFacilities = try await apiClient.getFacilitiesByID(orgID: testingIDs.orgId.rawValue, limit: 50, offset: 0)
        facilities = fetchedFacilities
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!facilities.isEmpty)
}


@Test("Retrieve a specific facility by Id")
func cangetFacilityById() async throws {
    var facility: Facility?
    let apiClient = createApiClient()
    var errorMessage: String?
    
    do {
        facility = try await apiClient.getFacilityByID(facilityID: testingIDs.facilityID.rawValue)
    } catch {
        errorMessage  = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(facility != nil)
}


@Test("Retrieve a specific facility by Id for an Organization")
func canGetFacilityByOrgIdAndFacilityId() async throws {
    var facility: Facility?
    let apiClient = createApiClient()
    var errorMessage: String?
    
    do {
        facility = try await apiClient.getFacilityByID(facilityID: testingIDs.facilityID.rawValue, orgID: testingIDs.orgId.rawValue)
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    printError(errorMessage)
    #expect(facility != nil)
}

@Test("Retrieve a specific facility by Id for a RecArea")
func canGetFacilityByRecAreaIdAndFacilityId() async throws {
    var facility: Facility?
    let apiClient = createApiClient()
    var errorMessage: String?
    
    do {
        facility = try await apiClient.getFacilityByID(facilityID: testingIDs.facilityID.rawValue, recAreaId: testingIDs.recAreaId.rawValue)
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(facility != nil)
}
