//
//  APIEndpoints.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

enum APIEndpoint {
    static let baseURL = URL(string: "https://api.openweathermap.org")
    
    case coordinateByLocationName(String)
    case weatherByLatLon(Double,Double)
    
    private var apiId: String {
        APIKeys.getWeatherAppId() ?? ""
    }
    
    private var path: String {
        switch self {
        case .coordinateByLocationName(let name):
            return "/geo/1.0/direct?q=\(name)&appid=\(apiId)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiId)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL? {
        return URL(string: endpoint.path, relativeTo: baseURL)
    }
}
