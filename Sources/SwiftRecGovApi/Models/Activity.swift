//
//  Activity.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 9/28/24.
//
// swift-recreationgov-api/Sources/Models/Activity.swift

import Foundation

public struct Activity: Codable, Sendable {
    public let id: Int
    public let name: String
    public let level: Int?
    public let parentID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "ActivityID"
        case name = "ActivityName"
        case level = "ActivityLevel"
        case parentID = "ActivityParentID"
    }
}
