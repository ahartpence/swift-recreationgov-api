// swift-recreationgov-api/Sources/RecreationGovApiClient/RecreationGovApiClient.swift

import Foundation

public actor RecreationGovApiClient {
    let baseURL: URL = URL(string: "https://ridb.recreation.gov/api/v1")!
    let networkManager: NetworkManager
    
    public init(apiKey: String) {
        self.networkManager = NetworkManager(apiKey: apiKey)
    }
}
