//
//  PlistReader.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumaloon 2026/03/05.
//

import Foundation

struct WeatherPlistReader {
    static func readValue(key: String) -> String? {
        guard let plistPath = Bundle.main.path(forResource: "WeatherAPI", ofType: "plist"),
           let plistData = FileManager.default.contents(atPath: plistPath),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let value = plist[key] as? String else {
            return nil
        }
        return value
    }
}
