//
//  RecAreas.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//
import Foundation
import Testing
import SwiftRecGovApi



@Test("Get all recareas, store values in [RecArea]")
func canGetAllRecAreas() async throws {
    var recAreas: [RecArea] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedRecAreas = try await apiClient.getAllRecAreas(limit: 50, offset: 0)
        recAreas = fetchedRecAreas
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(!recAreas.isEmpty)
    
}

@Test("Load a single RecArea by RecAreaID")
func canGetRecAreaByRecAreaID() async throws {
    var recArea: RecArea?
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        recArea = try await apiClient.getRecAreaByID(recAreaID: testingIDs.recAreaId.rawValue)
    } catch {
        errorMessage = "Failed to load activities: \(error.localizedDescription)"
    }
    
    printError(errorMessage)
    #expect(recArea != nil)
    
}

@Test("Load RecAreas for OrgID")
func canGetRecAreaByOrgID() async throws {
    var recAreas: [RecArea] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedRecAreas = try await apiClient.getRecAreasByID(orgID: testingIDs.orgId.rawValue)
        recAreas = fetchedRecAreas
    } catch {
        errorMessage = "Failed to load RecAreas: \(error)"
    }
    
    printError(errorMessage)
    #expect(!recAreas.isEmpty)
}

@Test("Load a single RecArea for RecAreaID and OrgID")
func canGetRecAreaByOrgAndRecID() async throws {
    var recAreas: [RecArea] = []
    var errorMessage: String?
    let apiClient = createApiClient()
    
    do {
        let fetchedRecAreas = try await apiClient.getRecAreaByID(recAreaID: testingIDs.recAreaId.rawValue, orgID: testingIDs.orgId.rawValue)
        recAreas.append(fetchedRecAreas!)
    } catch {
        errorMessage = "Failed to load RecAreas: \(error)"
    }
    
    printError(errorMessage)
    #expect(!recAreas.isEmpty)
}
