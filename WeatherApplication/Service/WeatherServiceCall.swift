//
//  WeatherServiceCall.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/05.
//

import Foundation

protocol WeatherAPIServiceCallProtocol {
    func getForecast(for city: String) async throws -> ForecastResponse
}

struct WeatherServiceCall: WeatherAPIServiceCallProtocol  {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func getForecast(for city: String) async throws -> ForecastResponse {
        
        guard let baseURL = WeatherPlistReader.readValue(key: "BaseWeatherURL"),
              let apiKey = WeatherPlistReader.readValue(key: "WeatherAPIKey") else {
            throw URLError(.badURL)
        }
        
        let parameters: [String: Any] = [
            "q": city,
            "appid": apiKey,
            "units": "imperial"
        ]
        
        let response: ForecastResponse = try await networkManager.request(
            endpoint: baseURL,
            method: .get,
            parameters: parameters,
            headers: nil)
        
        return response
    }
}
