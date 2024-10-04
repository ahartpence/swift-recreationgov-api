//
//  Link.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import Foundation


public struct Link: Codable, Sendable {
    public let id: String
    public let type: String
    public let parentID: String
    public let parentType: String
    public let title: String
    public let description: String
    public let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "EntityLinkID"
        case type = "LinkType"
        case parentID = "EntityID"
        case parentType = "EntityType"
        case title = "Title"
        case description = "Description"
        case url = "URL"
    }
}


