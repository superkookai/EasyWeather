//
//  ContentView.swift
//  EasyWeather
//
//  Created by Weerawut Chaiyasomboon on 06/03/2568.
//

import SwiftUI

struct ContentView: View {
    @State private var city: String = ""
    @State private var weather: Weather?
    @State private var countryCode: String = ""
    @State private var hasError: Bool = false
    @State private var showWeather: Bool = false
    
    let geo = GeocodingClient()
    let weatherClient = WeatherClient()
    
    private func getWeatherInfo() {
        Task {
            do {
                let location = try await geo.coordinateByCityName(city)
                if let location {
                    self.countryCode = location.country
                    self.weather = try await weatherClient.getWeather(location: location)
                    self.showWeather = true
                } else {
                    hasError = true
                }
            } catch {
                hasError = true
                print("DEBUG Error: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Easy Weather")
                    .font(.title)
                    .fontWeight(.bold)
                
                TextField("City", text: $city)
                    .font(.system(size: 30))
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button {
                    getWeatherInfo()
                } label: {
                    HStack {
                        Text("Get Weather")
                        Image(systemName: "sun.max")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.black)
                    .font(.title2)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.green.gradient)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal)
                }
                
            }
            .fullScreenCover(isPresented: $hasError) {
                let errorMessage = "Something went wrong, please try again"
                AlertMessageView(errorMessage: errorMessage)
            }
            
            
            VStack {
                if showWeather {
                    WeatherView(city: $city, showWeather: $showWeather, weather: weather!, countryCode: countryCode)
                        .transition(.scale)
                }
            }
            .animation(.easeInOut, value: showWeather)

        }
    }
}

#Preview {
    ContentView()
}
