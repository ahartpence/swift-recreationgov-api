//
//  Event.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//

public struct Event: Decodable, Sendable {
    public let id: String
    public let name: String
    public let link: String
    
    enum CodingKeys: String, CodingKey {
        case id = "EventID"
        case name = "EventName"
        case link = "ResourceLink"
    }
}
