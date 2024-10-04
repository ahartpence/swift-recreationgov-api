//
//  RecArea.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/19/24.
//

import Foundation

public struct RecArea: Codable, Identifiable, Sendable, Hashable {
    public let id: String
    public let orgRecAreaId: String
    public let parentOrgId: String?
    public let name: String
    public let description: String
    public let feeDescription: String
    public let directions: String
    public let phone: String
    public let email: String
    public let reservationURL: String
    public let mapURL: String
    public let geoJson: Geolocation
    public let longitude: Double
    public let latitude: Double
    public let stayLimit: String
    public let keywords: String
    public let reservable: Bool
    public let enabled: Bool
    public let lastUpdated: String
    public let org: [Organization]?
    public let facility: [FacilityRecArea]?
    public let address: [FacilityAddress]?
    public let activity: [FacilityActivity]?
    public let event: [Event]?
    public let media: [Media]?
    public let link: [Link]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "RecAreaID"
        case orgRecAreaId = "OrgRecAreaID"
        case parentOrgId = "ParentOrgID"
        case name = "RecAreaName"
        case description = "RecAreaDescription"
        case feeDescription = "RecAreaFeeDescription"
        case directions = "RecAreaDirections"
        case phone = "RecAreaPhone"
        case email = "RecAreaEmail"
        case reservationURL = "RecAreaReservationURL"
        case mapURL = "RecAreaMapURL"
        case geoJson = "GEOJSON"
        case longitude = "RecAreaLongitude"
        case latitude = "RecAreaLatitude"
        case stayLimit = "StayLimit"
        case keywords = "Keywords"
        case reservable = "Reservable"
        case enabled = "Enabled"
        case lastUpdated = "LastUpdatedDate"
        case org = "ORGANIZATION"
        case facility = "FACILITY"
        case address = "RECAREAADDRESS"
        case activity = "ACTIVITY"
        case media = "MEDIA"
        case event = "EVENT"
        case link = "LINK"
    }
    
    public static func == (lhs: RecArea, rhs: RecArea) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


