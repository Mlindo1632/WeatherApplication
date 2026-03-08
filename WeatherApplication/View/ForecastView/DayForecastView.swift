//
//  DayForecastView.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/07.
//

import SwiftUI

struct DayForecastView: View {
    
    let day: String
    let temprature: Int
    let imageName: String
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 8) {
                Text(day)
                    .font(.custom("Poppins-Regular.ttf", size: 36))
                    .fontWeight(.bold)
                    .lineSpacing(0)
                
                Image(imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
            
            Text("\(temprature)°")
                .font(.custom("Poppins-Regular.ttf", size: 16))
                .fontWeight(.semibold)
                .lineSpacing(0)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.9))
        )
    }
}

struct DayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DayForecastView(day: "Monday", temprature: 23, imageName: "Sunny")
    }
}
