//
//  ForecastView.swift
//  WeatherApplication
//
//  Created by Lindokuhle Khumalo on 2026/03/06.
//

import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                backgroundView
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        ForEach(viewModel.forecasts, id: \.dtTxt) { forecast in
                            DayForecastView(
                                day: viewModel.dayFromDate(forecast.dtTxt),
                                temprature: Int(forecast.main.temp),
                                imageName: "Property 1=01.sun-light"
                            )
                        }
                    }
                }
            }
            .navigationTitle("5 Day forecast in \(viewModel.cityName)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        DismissButton()
                    }
                }
            }
        }
    }
}


struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: WeatherViewModel())
    }
}

extension ForecastView {
    
    @ViewBuilder
    var backgroundView: some View {
        
        Image(backgroundImageName)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
        
    private var backgroundImageName: String {
        switch viewModel.weatherCondition {
            
        case .sunny: return "Sunny"
        case .cloudy: return "Cloudy"
        case .rainy: return "Rainy"
        }
    }
}
