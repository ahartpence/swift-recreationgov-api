//
//  Utils.swift
//  swift-recreationgov-api
//
//  Created by Andrew Hartpence on 10/21/24.
//
import Foundation

public extension RecreationGovApiClient {
    
    /**
     An enumerator for choosing how we want to sort the reponses from the API. Not all endpoints take a SortingKey
     */
    enum SortingKey: String, CodingKey {
        case name = "name"
        case id = "id"
        case date = "date"
    }
    
    
    /**
     Fetches data from a specified URL, decodes the response into an array of a generic `Codable` type, and handles potential decoding errors.

     This method uses a generic type `T` conforming to `Codable`, allowing it to decode different types of data structures. It also prints the raw response data in the console for debugging purposes.

     - Parameters:
       - type: The type of data to decode (conforming to `Codable`).
       - queryItems: An array of `URLQueryItem` objects for specifying query parameters in the URL.
       - url: The `URL` from which data will be fetched.
     
     - Returns: An array of decoded objects of type `T` or an empty array if decoding fails.
     
     - Throws: Throws an error if fetching data from the network fails.
     
     - Important: If the decoding fails, this method prints detailed error information in the console, including the problematic data.
     */
    func fetchAndDecode<T: Decodable>(url: URL, queryItems: [URLQueryItem]) async throws -> [T] {
        // Fetch data using the NetworkManager with the provided query items
        let data = try await networkManager.fetchData(from: url, queryItems: queryItems)
        
        // Debugging: Print raw response data as a string
//        print(String(bytes: data, encoding: String.Encoding.utf8)!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            // Attempt to decode the response into the specified type
            let response = try decoder.decode(RecGovApiResponse<T>.self, from: data)
            return response.recreationData
        } catch let decodingError as DecodingError {
            // Handle specific decoding errors
            handleDecodingError(decodingError, data: data)
        } catch {
            // Handle general errors (network, etc.)
            print("Unexpected error: \(error.localizedDescription)")
            print("Problematic data: \(String(decoding: data, as: UTF8.self))")
        }
        return []
    }
    
    /**
     Fetches data from a specified URL, decodes the response into an array of a generic `Codable` type, and handles potential decoding errors.

     This method uses a generic type `T` conforming to `Codable`, allowing it to decode different types of data structures. It also prints the raw response data in the console for debugging purposes.

     - Parameters:
       - type: The type of data to decode (conforming to `Codable`).
       - url: The `URL` from which data will be fetched.
     
     - Returns: An array of decoded objects of type `T` or an empty array if decoding fails.
     
     - Throws: Throws an error if fetching data from the network fails.
     
     - Important: If the decoding fails, this method prints detailed error information in the console, including the problematic data.
     */
    func fetchAndDecode<T: Decodable>(url: URL) async throws -> [T] {
        // Fetch data using the NetworkManager with the provided query items
        let data = try await networkManager.fetchData(from: url)
        
        // Debugging: Print raw response data as a string
//        print(String(bytes: data, encoding: String.Encoding.utf8)!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            // Attempt to decode the response into the specified type
            let response = try decoder.decode(RecGovApiResponse<T>.self, from: data)
            return response.recreationData
        } catch let decodingError as DecodingError {
            // Handle specific decoding errors
            handleDecodingError(decodingError, data: data)
        } catch {
            // Handle general errors (network, etc.)
            print("Unexpected error: \(error.localizedDescription)")
            print("Problematic data: \(String(decoding: data, as: UTF8.self))")
        }
        return []
    }
    
    /**
     Fetches data from a specified URL, decodes the response into a single object of a generic `Codable` type, and handles potential decoding errors.

     This method uses a generic type `T` conforming to `Codable`, allowing it to decode different types of data structures. It also prints the raw response data in the console for debugging purposes.

     - Parameters:
       - type: The type of data to decode (conforming to `Codable`).
       -  queryItems: An array of `URLQueryItem` objects for specifying query parameters in the URL.
       - url: The `URL` from which data will be fetched.
     
     - Returns: A decoded object of type `T` or `nil` if decoding fails.
     
     - Throws: Throws an error if fetching data from the network fails.
     
     - Important: If the decoding fails, this method prints detailed error information in the console, including the problematic data.
     */
    func fetchAndDecode<T: Decodable>(url: URL) async throws -> T? {
        // Fetch data using the NetworkManager
        let data = try await networkManager.fetchData(from: url)
        
        // Debugging: Print raw response data as a string
//        print(String(bytes: data, encoding: String.Encoding.utf8)!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            // Attempt to decode the response into the specified type
            let response = try decoder.decode(T.self, from: data)
            
            return response
        } catch let decodingError as DecodingError {
            // Handle specific decoding errors
            handleDecodingError(decodingError, data: data)
        } catch {
            // Handle general errors (network, etc.)
            print("Unexpected error: \(error.localizedDescription)")
            print("Problematic data: \(String(decoding: data, as: UTF8.self))")
        }
        return nil
    }
    
    /**
     Fetches data from a specified URL, decodes the response into a single object of a generic `Codable` type, and handles potential decoding errors.

     This method uses a generic type `T` conforming to `Codable`, allowing it to decode different types of data structures. It also prints the raw response data in the console for debugging purposes.

     - Parameters:
       - type: The type of data to decode (conforming to `Codable`).
       - url: The `URL` from which data will be fetched.
     
     - Returns: A decoded object of type `T` or `nil` if decoding fails.
     
     - Throws: Throws an error if fetching data from the network fails.
     
     - Important: If the decoding fails, this method prints detailed error information in the console, including the problematic data.
     */
    func fetchAndDecode<T: Decodable>(url: URL, queryItems: [URLQueryItem]) async throws -> T? {
        // Fetch data using the NetworkManager
        let data = try await networkManager.fetchData(from: url, queryItems: queryItems)
        
        // Debugging: Print raw response data as a string
//        print(String(bytes: data, encoding: String.Encoding.utf8)!)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys

        do {
            // Attempt to decode the response into the specified type
            let response = try decoder.decode(T.self, from: data)
            
            return response
        } catch let decodingError as DecodingError {
            // Handle specific decoding errors
            handleDecodingError(decodingError, data: data)
        } catch {
            // Handle general errors (network, etc.)
            print("Unexpected error: \(error.localizedDescription)")
            print("Problematic data: \(String(decoding: data, as: UTF8.self))")
        }
        return nil
    }
    
    /**
     A helper function to handle decoding errors by printing detailed error messages and raw problematic data.

     - Parameters:
       - decodingError: The error that occurred during the decoding process.
       - data: The raw response data that failed to decode.
     */
    private func handleDecodingError(_ decodingError: DecodingError, data: Data) {
        switch decodingError {
        case .typeMismatch(let type, let context):
            print("Type mismatch for type \(type) in context: \(context.debugDescription)")
            if let range = context.codingPath.last {
                print("Error occurred at key: \(range.stringValue)")
            }
        case .valueNotFound(let type, let context):
            print("Value not found for type \(type) in context: \(context.debugDescription)")
            if let range = context.codingPath.last {
                print("Error occurred at key: \(range.stringValue)")
            }
        case .keyNotFound(let key, let context):
            print("Key '\(key.stringValue)' not found in context: \(context.debugDescription)")
            if let range = context.codingPath.last {
                print("Error occurred at key: \(range.stringValue)")
            }
        case .dataCorrupted(let context):
            print("Data corrupted: \(context.debugDescription)")
            if let range = context.codingPath.last {
                print("Error occurred at key: \(range.stringValue)")
            }
        @unknown default:
            print("Unknown decoding error: \(decodingError)")
        }
        // Print problematic data for further debugging
        print("Problematic data: \(String(decoding: data, as: UTF8.self))")
    }
}
