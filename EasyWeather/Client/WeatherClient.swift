//
//  WeatherClient.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

struct WeatherClient {
    
    func getWeather(location: Location) async throws -> Weather {
        guard let url = APIEndpoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon)) else {
            throw NetworkError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        guard let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else {
            throw NetworkError.decodedError
        }
        
        return weatherResponse.main
    }
}
