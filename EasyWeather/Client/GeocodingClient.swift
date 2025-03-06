//
//  GeocodingClient.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case decodedError
    case noLocationFound
    
    var errorMessage: String {
        switch self {
        case .badURL, .badResponse, .decodedError:
            return "Error connecting with server, please try again"
        case .noLocationFound:
            return "No location found, please try again"
        }
    }
}

struct GeocodingClient {
    func coordinateByCityName(_ name: String) async throws -> Location? {
        guard let url = APIEndpoint.endpointURL(for: .coordinateByLocationName(name)) else {
            throw NetworkError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        guard let locations = try? JSONDecoder().decode([Location].self, from: data) else {
            throw NetworkError.decodedError
        }
        
        return locations.first
    }
}
