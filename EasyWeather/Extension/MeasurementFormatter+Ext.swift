//
//  MeasurementFormatter+Ext.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import Foundation

extension MeasurementFormatter {
    static func temperature(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numberFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        
        return formatter.string(from: temp)
    }
}
