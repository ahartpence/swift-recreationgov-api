//
//  RecArea.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/19/24.
//

import Foundation

public struct RecArea: Decodable, Sendable, Hashable, Identifiable  {
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
    
    public init(id: String, orgRecAreaId: String, parentOrgId: String?, name: String, description: String, feeDescription: String, directions: String, phone: String, email: String, reservationURL: String, mapURL: String, geoJson: Geolocation, longitude: Double, latitude: Double, stayLimit: String, keywords: String, reservable: Bool, enabled: Bool, lastUpdated: String, org: [Organization]?, facility: [FacilityRecArea]?, address: [FacilityAddress]?, activity: [FacilityActivity]?, event: [Event]?, media: [Media]?, link: [Link]?) {
        self.id = id
        self.orgRecAreaId = orgRecAreaId
        self.parentOrgId = parentOrgId
        self.name = name
        self.description = description
        self.feeDescription = feeDescription
        self.directions = directions
        self.phone = phone
        self.email = email
        self.reservationURL = reservationURL
        self.mapURL = mapURL
        self.geoJson = geoJson
        self.longitude = longitude
        self.latitude = latitude
        self.stayLimit = stayLimit
        self.keywords = keywords
        self.reservable = reservable
        self.enabled = enabled
        self.lastUpdated = lastUpdated
        self.org = org
        self.facility = facility
        self.address = address
        self.activity = activity
        self.event = event
        self.media = media
        self.link = link
    }
    
    
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


