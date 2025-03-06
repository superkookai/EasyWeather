//
//  Weather.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

