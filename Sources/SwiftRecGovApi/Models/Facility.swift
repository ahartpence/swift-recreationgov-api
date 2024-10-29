//
//  Facility.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import SwiftUI

public struct Facility: Decodable, Identifiable, Sendable {
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
    public let event: [Event]?
    public let link: [Link]?
    public let media: [Media]?
    
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
        case address = "ADDRESS"
        case event = "EVENT"
        case link = "LINK"
        case media = "MEDIA"
    }
}

public struct Geolocation: Decodable, Sendable {
    public let type: String
    public let coordinates: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case coordinates = "COORDINATES"
    }
}

public struct FacilityCampsite: Decodable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "CampsiteID"
        case name = "CampsiteName"
        case url  = "ResourceLink"
    }
}

public struct FacilityTour: Decodable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "TourID"
        case name = "TourName"
        case url  = "ResourceLink"
    }
}

public struct FacilityRecArea: Decodable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "RecAreaID"
        case name = "RecAreaName"
        case url  = "ResourceLink"
    }
}

public struct FacilityAddress: Decodable, Sendable {
    public let id: String
    public let facilityId: String
    public let type: String
    public let addressLine1: [String]
    public let addressLine2: String
    public let addressLine3: String
    public let city: String
    public let postalCode: String
    public let stateCode: String
    public let countryCode: String
    public let updatedDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "FacilityAddressID"
        case facilityId = "FacilityID"
        case type = "FacilityAddressType"
        case addressLine1 = "FacilityStreetAddress1"
        case addressLine2 = "FacilityStreetAddress2"
        case addressLine3 = "FacilityStreetAddress3"
        case city = "City"
        case postalCode = "PostalCode"
        case stateCode = "AddressStateCode"
        case countryCode = "AddressCountryCode"
        case updatedDate = "LastUpdatedDate"
    }
}


public struct FacilityActivity: Decodable, Sendable {
    public let id: String
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


public struct FacilityPermitEntrance: Decodable, Sendable {
    public let id: String
    public let name: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "PermitEntranceID"
        case name = "PermitEntranceName"
        case url = "ResourceLink"
    }
}
