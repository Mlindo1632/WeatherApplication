//
//  ForecastResponse.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/05.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [Forecast]
    let city: City
}

struct City: Codable {
    let id: Int
    let name: String
}

struct Forecast: Codable {
    let dtTxt: String
    let main: MainClass
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dtTxt = "dt_txt"
        case main
        case weather
    }
}

struct MainClass: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: MainEnum
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}
