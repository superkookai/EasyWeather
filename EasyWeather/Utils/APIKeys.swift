//
//  APIKeys.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

struct APIKeys {
    static func getWeatherAppId() -> String? {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            return dict["weatherAPIKey"] as? String
        }
        return nil
    }
}
