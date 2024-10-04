import Foundation

actor NetworkManager: Sendable {

    private let session: URLSession
    private let apiKey: String

    init(session: URLSession = .shared, apiKey: String) {
        self.session = session
        self.apiKey = apiKey
    }

    // Fetch data from a URL asynchronously using URLRequest
    func fetchData(from url: URL, queryItems: [URLQueryItem]? = nil) async throws -> Data {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems

        guard let finalURL = components?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        
        // Set headers
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue(apiKey, forHTTPHeaderField: "apikey")

        let (data, response) = try await session.data(for: request)

        print("Accessing Url: \(finalURL.absoluteString)")

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return data
    }
}
