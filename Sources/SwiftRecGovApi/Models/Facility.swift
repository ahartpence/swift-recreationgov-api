//
//  Facility.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import SwiftUI

public struct Facility: Codable, Identifiable, Sendable {
    public let id: String
    public let legacyFacilityID: String
    public let orgFacilityID: String
    public let parentOrgID: String?
    public let parentRecAreaID: String?
    public let name: String
    public let description: String
    public let typeDescription: String
    public let useFeeDescription: String
    public let directions: String
    public let accessibilityText: String
    public let phone: String
    public let email: String
    public let reservationURL: String
    public let mapURL: String
    public let adaAccess: String
    public let geoJson: Geolocation
    public let latitude: Double
    public let longitude: Double
    public let stayLimit: String
    public let keywords: String
    public let reservable: Bool
    public let enabled: Bool
    public let lastedUpdated: String
    public let campsite: [FacilityCampsite]?
    public let permitEntrance: [FacilityPermitEntrance]?
    public let tour: [FacilityTour]?
    public let org: [Organization]?
    public let recArea: [FacilityRecArea]?
    public let address: [FacilityAddress]?
    public let activity: [FacilityActivity]?
    public let event: [Event]?
    public let link: [Link]?
    public let media: [Media]?
    
    
    public init(id: String, legacyFacilityID: String, orgFacilityID: String, parentOrgID: String?, parentRecAreaID: String?, name: String, description: String, typeDescription: String, useFeeDescription: String, directions: String, accessibilityText: String, phone: String, email: String, reservationURL: String, mapURL: String, adaAccess: String, geoJson: Geolocation, latitude: Double, longitude: Double, stayLimit: String, keywords: String, reservable: Bool, enabled: Bool, lastedUpdated: String, campsite: [FacilityCampsite]?, permitEntrance: [FacilityPermitEntrance]?, tour: [FacilityTour]?, org: [Organization]?, recArea: [FacilityRecArea]?, address: [FacilityAddress]?, activity: [FacilityActivity]?, event: [Event]?, link: [Link]?, media: [Media]?) {
        self.id = id
        self.legacyFacilityID = legacyFacilityID
        self.orgFacilityID = orgFacilityID
        self.parentOrgID = parentOrgID
        self.parentRecAreaID = parentRecAreaID
        self.name = name
        self.description = description
        self.typeDescription = typeDescription
        self.useFeeDescription = useFeeDescription
        self.directions = directions
        self.accessibilityText = accessibilityText
        self.phone = phone
        self.email = email
        self.reservationURL = reservationURL
        self.mapURL = mapURL
        self.adaAccess = adaAccess
        self.geoJson = geoJson
        self.latitude = latitude
        self.longitude = longitude
        self.stayLimit = stayLimit
        self.keywords = keywords
        self.reservable = reservable
        self.enabled = enabled
        self.lastedUpdated = lastedUpdated
        self.campsite = campsite
        self.permitEntrance = permitEntrance
        self.tour = tour
        self.org = org
        self.recArea = recArea
        self.address = address
        self.activity = activity
        self.event = event
        self.link = link
        self.media = media
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "FacilityID"
        case legacyFacilityID = "LegacyFacilityID"
        case orgFacilityID = "OrgFacilityID"
        case parentOrgID = "ParentOrgID"
        case parentRecAreaID = "ParentRecAreaID"
        case name = "FacilityName"
        case description = "FacilityDescription"
        case typeDescription = "FacilityTypeDescription"
        case useFeeDescription = "FacilityUseFeeDescription"
        case directions = "FacilityDirections"
        case accessibilityText = "FacilityAccessibilityText"
        case phone = "FacilityPhone"
        case email = "FacilityEmail"
        case reservationURL = "FacilityReservationURL"
        case mapURL = "FacilityMapURL"
        case adaAccess = "FacilityAdaAccess"
        case geoJson = "GEOJSON"
        case longitude = "FacilityLongitude"
        case latitude = "FacilityLatitude"
        case stayLimit = "StayLimit"
        case keywords = "Keywords"
        case reservable = "Reservable"
        case enabled = "Enabled"
        case lastedUpdated = "LastUpdatedDate"
        case campsite = "CAMPSITE"
        case permitEntrance = "PERMITENTRANCE"
        case tour = "TOUR"
        case org = "ORGANIZATION"
        case recArea = "RECAREA"
        case address = "FACILITYADDRESS"
        case activity = "ACTIVITY"
        case event = "EVENT"
        case link = "LINK"
        case media = "MEDIA"
    }
}

public struct Geolocation: Codable, Sendable {
    public let type: String
    public let coordinates: [Double]?
    
    public init(type: String, coordinates: [Double]?) {
        self.type = type
        self.coordinates = coordinates
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case coordinates = "COORDINATES"
    }
}

public struct FacilityCampsite: Codable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "CampsiteID"
        case name = "CampsiteName"
        case url  = "ResourceLink"
    }
}

public struct FacilityTour: Codable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "TourID"
        case name = "TourName"
        case url  = "ResourceLink"
    }
}

public struct FacilityRecArea: Codable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "RecAreaID"
        case name = "RecAreaName"
        case url  = "ResourceLink"
    }
}

public struct FacilityAddress: Codable, Sendable, Hashable{
    public let facilityID: String
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
    
    public init(facilityID: String, addressID: String, addressType: String, line1: String, line2: String, line3: String, city: String, postalCode: String, stateCode: String, countryCode: String, lastUpdatedDate: String) {
        self.facilityID = facilityID
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
    
    public static func == (lhs: FacilityAddress, rhs: FacilityAddress) -> Bool {
        return lhs.addressID == rhs.addressID
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(addressID)
    }
    
    enum CodingKeys: String, CodingKey {
        case facilityID = "FacilityAddressID"
        case addressID = "FacilityID"
        case addressType = "FacilityAddressType"
        case line1 = "FacilityStreetAddress1"
        case line2 = "FacilityStreetAddress2"
        case line3 = "FacilityStreetAddress3"
        case city = "City"
        case postalCode = "PostalCode"
        case stateCode = "AddressStateCode"
        case countryCode = "AddressCountryCode"
        case lastUpdatedDate = "LastUpdatedDate"
    }
}


public struct FacilityActivity: Codable, Sendable {
    public let id: Int
    public let facilityId: String
    public let name: String
    public let description: String
    public let feesDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ActivityID"
        case facilityId = "FacilityID"
        case name = "ActivityName"
        case description = "FacilityActivityDescription"
        case feesDescription = "FacilityActivityFeeDescription"
    }
}


public struct FacilityPermitEntrance: Codable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "PermitEntranceID"
        case name = "PermitEntranceName"
        case url = "ResourceLink"
    }
}
