//
//  WeatherViewModel.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/05.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    private let weatherService: WeatherAPIServiceCallProtocol
    
    @Published var forecasts: [Forecast] = []
    @Published var cityName: String = ""
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    @Published var navigateToForecast = false
    @Published var loadingState: ContentLoadingState<[Forecast]> = .loading
    
    @Published var isLoading = false
    
    @Published var weatherCondition: WeatherCondition = .sunny
    
    init(weatherService: WeatherAPIServiceCallProtocol = WeatherServiceCall()) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(for city: String) async {
        
        isLoading = true
        
        defer {isLoading = false }
        
        do {
            let response = try await weatherService.getForecast(for: city)
            
            cityName = response.city.name
            forecasts = filterDailyForecast(response.list)
            
            if let weatherId = response.list.first?.weather.first?.id {
                updateWeatherCondition(code: weatherId)
            }
            
            print("Decoding success")
            
            navigateToForecast = true
            
        } catch {
            alertMessage = "City not found. Please try another city."
            showAlert = true
            print("Decoding failed")
        }
    }
    
    private func filterDailyForecast(_ forecasts: [Forecast]) -> [Forecast] {
        forecasts.filter{$0.dtTxt.hasSuffix("12:00:00")}
    }
}

extension WeatherViewModel {

    private func updateWeatherCondition( code: Int) {
        switch code {
        case 800:
            weatherCondition = .sunny
            
        case 801...804:
            weatherCondition = .cloudy
            
        case 200...531:
            weatherCondition = .rainy
            
        default:
            weatherCondition = .sunny
        }
    }
}

extension WeatherViewModel {
    func dayFromDate(_ DateString: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss "
        
        guard let date = formatter.date(from: DateString) else {
            return ""
        }
        
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
