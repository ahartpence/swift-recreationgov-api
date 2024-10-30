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
    public let facility: [RecAreaFacility]?
    public let address: [RecAreaAddress]?
    public let activity: [RecAreaActivity]?
    public let event: [Event]?
    public let media: [Media]?
    public let link: [Link]?
    
    public init(id: String, orgRecAreaId: String, parentOrgId: String?, name: String, description: String, feeDescription: String, directions: String, phone: String, email: String, reservationURL: String, mapURL: String, geoJson: Geolocation, longitude: Double, latitude: Double, stayLimit: String, keywords: String, reservable: Bool, enabled: Bool, lastUpdated: String, org: [Organization]?, facility: [RecAreaFacility]?, address: [RecAreaAddress]?, activity: [RecAreaActivity]?, event: [Event]?, media: [Media]?, link: [Link]?) {
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

public struct RecAreaActivity: Decodable, Sendable, Hashable {
    public let id: Int
    public let parentID: String
    public let recAreaID: String
    public let activityName: String
    public let recAreaActivityDescription: String
    public let recAreaFeeDescription: String
    
    public init(id: Int, parentID: String, recAreaID: String, activityName: String, recAreaActivityDescription: String, recAreaFeeDescription: String) {
        self.id = id
        self.parentID = parentID
        self.recAreaID = recAreaID
        self.activityName = activityName
        self.recAreaActivityDescription = recAreaActivityDescription
        self.recAreaFeeDescription = recAreaFeeDescription
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "ActivityID"
        case parentID = "ActivityParentID"
        case recAreaID = "RecAreaID"
        case activityName = "ActivityName"
        case recAreaActivityDescription = "RecAreaActivityDescription"
        case recAreaFeeDescription = "RecAreaActivityFeeDescription"
    }
    public static func == (lhs: RecAreaActivity, rhs: RecAreaActivity) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public struct RecAreaAddress: Decodable, Sendable, Hashable{
    public let recAreaID: String
    public let addressID: String
    public let addressType: String
    public let line1: String
    public let line2: String
    public let line3: String
    public let city: String
    public let postalCode: String
    public let stateCode: String
    public let countryCode: String
    public let lastUpdatedDate: String
    
    public init(recAreaID: String, addressID: String, addressType: String, line1: String, line2: String, line3: String, city: String, postalCode: String, stateCode: String, countryCode: String, lastUpdatedDate: String) {
        self.recAreaID = recAreaID
        self.addressID = addressID
        self.addressType = addressType
        self.line1 = line1
        self.line2 = line2
        self.line3 = line3
        self.city = city
        self.postalCode = postalCode
        self.stateCode = stateCode
        self.countryCode = countryCode
        self.lastUpdatedDate = lastUpdatedDate
    }
    
    public static func == (lhs: RecAreaAddress, rhs: RecAreaAddress) -> Bool {
        return lhs.addressID == rhs.addressID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(addressID)
    }
    
    enum CodingKeys: String, CodingKey {
        case recAreaID = "RecAreaID"
        case addressID = "RecAreaAddressID"
        case addressType = "RecAreaAddressType"
        case line1 = "RecAreaStreetAddress1"
        case line2 = "RecAreaStreetAddress2"
        case line3 = "RecAreaStreetAddress3"
        case city = "City"
        case postalCode = "PostalCode"
        case stateCode = "AddressStateCode"
        case countryCode = "AddressCountryCode"
        case lastUpdatedDate = "LastUpdatedDate"
    }
}

public struct RecAreaFacility: Decodable, Sendable, Hashable {
    public let id: String
    public let name: String
    public let url: String
    
    public init(id: String, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    public static func == (lhs: RecAreaFacility, rhs: RecAreaFacility) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "FacilityID"
        case name = "FacilityName"
        case url = "ResourceLink"
    }
}

