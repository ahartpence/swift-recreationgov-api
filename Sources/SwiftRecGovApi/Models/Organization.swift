//
//  Organization.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

public struct Organization: Decodable, Sendable {
    public let id: String
    public let name: String
    public let imageURL: String
    public let urlText: String
    public let orgURL: String
    public let type: String
    public let abbrevName: String
    public let jusisdictionType: String
    public let parentID: String
    public let lastUpdatedDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "OrgID"
        case name = "OrgName"
        case imageURL = "OrgImageURL"
        case urlText = "OrgURLText"
        case orgURL = "OrgURLAddress"
        case type = "OrgType"
        case abbrevName = "OrgAbbrevName"
        case jusisdictionType = "OrgJurisdictionType"
        case parentID = "OrgParentID"
        case lastUpdatedDate = "LastUpdatedDate"

    }
    
}
