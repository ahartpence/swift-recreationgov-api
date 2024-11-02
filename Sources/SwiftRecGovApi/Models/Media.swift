//
//  Media.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

import Foundation


public struct Media: Decodable, Sendable {
    public let mediaID: String?
    public let mediaType: String?
    public let entityID: String?
    public let entityType: String?
    public let title: String
    public let subittle: String
    public let description: String
    public let embedCode: String
    public let height: Int
    public let width: Int
    public let isPrimaryImage: Bool?
    public let isPreviewImage: Bool?
    public let isGaleryImage: Bool?
    public let url: String
    public let credits: String
    
    public enum CodingKeys: String, CodingKey {
        case mediaID = "EntityMediaID"
        case mediaType = "MediaType"
        case entityID = "EntityID"
        case entityType = "EntityType"
        case title = "Title"
        case subittle = "Subtitle"
        case description = "Description"
        case embedCode = "EmbedCode"
        case height = "Height"
        case width = "Width"
        case isPrimaryImage = "IsPrimary"
        case isPreviewImage = "IsPreview"
        case isGaleryImage = "IsGallery"
        case url = "URL"
        case credits = "Credits"
    }
}
