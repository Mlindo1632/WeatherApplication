//
//  WeatherApplicationApp.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/05.
//

import SwiftUI

@main
struct WeatherApplicationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CitySearchView()
            }
        }
    }
}
