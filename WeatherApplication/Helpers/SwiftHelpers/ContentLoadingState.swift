//
//  ContentLoadingState.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/06.
//

import Foundation

enum ContentLoadingState <T: Codable> {
    case loading
    case empty
    case error(Error)
    case complete(data: T)
}
