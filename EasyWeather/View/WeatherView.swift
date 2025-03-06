//
//  WeatherView.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import SwiftUI
import SwiftFlags

struct WeatherView: View {
    @Binding var city: String
    @Binding var showWeather: Bool
    let weather: Weather
    let countryCode: String
    
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                let flag = SwiftFlags.flag(for: countryCode) ?? ""
                Text("Hello \(flag)")
                    .font(.largeTitle)
                
                VStack {
                    Text(city)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "thermometer.variable.and.figure")
                        Text(MeasurementFormatter.temperature(weather.temp))
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                }
                
                HStack {
                    Text("Min:")
                    Text(MeasurementFormatter.temperature(weather.temp_min))
                    
                    Text("Max:")
                    Text(MeasurementFormatter.temperature(weather.temp_max))
                }
            }
            .padding(50)
            .frame(width: 350)
            .background(.ultraThickMaterial)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 5, y: 1)
            .overlay(alignment: .top) {
                Button {
                    showWeather.toggle()
                    city = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(.black)
                }
                .offset(y: -40)
            }
            
        }
    }
}

#Preview {
    WeatherView(city: .constant("Bangkok"), showWeather: .constant(true), weather: Weather(temp: 309.76, temp_min: 308.11, temp_max: 309.81), countryCode: "TH")
}

