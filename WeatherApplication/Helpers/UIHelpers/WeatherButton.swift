//
//  WeatherButton.swift
//  WeatherApplication
//
//  Created by Nhlanhla Kubayi on 2026/03/06.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "")
    }
}
