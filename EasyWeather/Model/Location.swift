//
//  Location.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
}
