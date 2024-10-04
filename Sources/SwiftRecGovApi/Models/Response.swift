//
//  Response.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/4/24.
//
import Foundation


public struct RecGovApiResponse<T: Codable>: Codable {
    public let recreationData: [T]
    
    enum CodingKeys: String, CodingKey {
        case recreationData = "RECDATA"
    }
}
