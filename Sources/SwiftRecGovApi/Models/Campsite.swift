//
//  Campsite.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import Foundation

public struct Campsite: Codable, Sendable, Identifiable{
    public let id: String
    public let facilityID: String?
    public let name: String
    public let type: String
    public let typeOfUse: String
    public let loop: String
    public let vehicleAccessable: Bool
    public let longitude: Double
    public let latitude: Double
    public let createdDate: String
    public let lastUpdatedDate: String
    public let attributes: [CampAttributes]?
    public let allowedEquipment: [PermittedEquipment]?
    public let media: [Media]?
    
    
    public enum CodingKeys: String, CodingKey {
        case id = "CampsiteID"
        case facilityID = "FacilityID"
        case name = "CampsiteName"
        case type = "CampsiteType"
        case typeOfUse = "TypeOfUse"
        case loop = "Loop"
        case vehicleAccessable = "CampsiteAccessible"
        case longitude = "CampsiteLongitude"
        case latitude = "CampsiteLatitude"
        case createdDate = "CreatedDate"
        case lastUpdatedDate = "LastUpdatedDate"
        case attributes = "ATTRIBUTES"
        case allowedEquipment = "PERMITTEDEQUIPMENT"
        case media = "ENTITYMEDIA"
    }
}


public struct CampAttributes: Codable, Sendable {
    public let id: Int?
    public let name: String
    public let value: String
    
    enum CodingKeys: String, CodingKey {
        case id = "AttributeID"
        case name = "AttributeName"
        case value = "AttributeValue"
    }
}

public struct PermittedEquipment: Codable, Sendable {
    public let name: String
    public let maxLength: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "EquipmentName"
        case maxLength = "MaxLength"
    }
}